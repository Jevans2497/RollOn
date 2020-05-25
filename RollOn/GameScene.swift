import SpriteKit

let BallCategory  : UInt32 = 0x1 << 1
let GoalCategory: UInt32 = 0x1 << 2
let WallCategory: UInt32 = 0x1 << 3

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var balls: Array<Ball> = Array()
    var currentBall: Ball? = nil
    var startAndResetLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        setLevelToStart()
    }
    
    func setLevelToStart() {
        removeAllChildren()
        balls.removeAll()
        currentBall = nil
        setupBackground()
        setupStartLabel()
        setupLevel1()
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "mountain.png")
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
    }
    
    func setupStartLabel() {
        startAndResetLabel = SKLabelNode(fontNamed: "Chalkduster")
        startAndResetLabel.text = "Start"
        startAndResetLabel.position = CGPoint(x: -400.0, y: 300.0)
        startAndResetLabel.zPosition = 1000
        addChild(startAndResetLabel)
    }
    
    func setupLevel1() {
        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let position = CGPoint(x: 150 + leftmost, y: 0.0)
        let ball = Ball(ballColor: "Blue")
        ball.position = position
        
        let positionTheSecond = CGPoint(x: 300, y: 0.0)
        let ballTheSecond = Ball(ballColor: "Red")
        ballTheSecond.position = positionTheSecond
        
        balls.append(ball)
        balls.append(ballTheSecond)
        addChild(ball)
        addChild(ballTheSecond)
        
        let goal = Goal()
        goal.position = CGPoint(x: 0.0, y: 0.0)
        addChild(goal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if nodes(at: location).contains(startAndResetLabel) {
                startOrResetClicked()
            } else {
                ballTouched(location: location)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            drawArrow(location: location)
        }
    }
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            ballTouchEnded(location: location)
        }
    }
    
    func ballTouched(location: CGPoint) {
        if startAndResetLabel.text == "Reset" { return }
        if let object = nodes(at: location).first as? Ball {
            let ball = balls.first(where: { $0.name == object.name } )
            ball?.physicsBody?.isDynamic = false
            ball?.startLocation = ball?.position as! CGPoint
            currentBall = ball
        }
    }
    
    func drawArrow(location: CGPoint) {
        if let cb = currentBall {
            cb.arrow.touchLocation = location
            let arrowToDraw = cb.arrow
            removeArrow(arrowName: arrowToDraw.name!)
            addChild(arrowToDraw)
        }
    }
    
    func ballTouchEnded(location: CGPoint) {
        if currentBall != nil {
            let cb = balls.first(where: { $0.name == currentBall?.name } )
            cb?.endLocation = location
            currentBall = nil
        }
    }
    
    func startOrResetClicked() {
        let shouldStart = startAndResetLabel.text == "Start"
        shouldStart ? startSimulation() : setLevelToStart()
    }
    
    func startSimulation() {
        startAndResetLabel.text = "Reset"
        removeAllPreexistingArrows()
        for ball in balls {
            ball.simulate()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
                
        if nodeA.name == "goal" {
            goalReached(node: nodeB)
        } else if nodeB.name == "goal" {
            goalReached(node: nodeA)
        }
    }
    
    func goalReached(node: SKNode) {
        let ball = node as! Ball
        ball.inGoal()
    }
    
    private func removeArrow(arrowName: String) {
           if let node = childNode(withName: arrowName) {
               removeChildren(in: [node])
           }
       }
       
       private func removeAllPreexistingArrows() {
           for ball in balls {
               let arrowName = ball.arrow.name!
               removeArrow(arrowName: arrowName)
           }
       }
}
