import SpriteKit

class GameScene: SKScene {
    
    var balls: Array<Ball> = Array()
    var currentBall: Ball? = nil
    var startLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
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
        background.name = "background"
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
    }
    
    func setupStartLabel() {
        startLabel = SKLabelNode(fontNamed: "Chalkduster")
        startLabel.text = "Start"
        startLabel.position = CGPoint(x: 0.0, y: 0.0)
        addChild(startLabel)
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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if nodes(at: location).contains(startLabel) {
                startOrReset()
            } else {
                if let object = nodes(at: location).first as? Ball {
                    let ball = balls.first(where: { $0.name == object.name } )
                    ball?.physicsBody?.isDynamic = false
                    ball?.startLocation = ball?.position as! CGPoint
                    currentBall = ball
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let cb = currentBall {
                cb.arrow.touchLocation = touch.location(in: self)
                let drawnArrow = cb.arrow
                removeArrow(arrowName: drawnArrow.name!)
                addChild(drawnArrow)
            }
        }
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
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if currentBall != nil {
                let ball = balls.first(where: { $0.name == currentBall?.name } )
                ball?.endLocation = location
                currentBall = nil
            }
        }
    }
    
    func startOrReset() {
        let shouldStart = startLabel.text == "Start"
        shouldStart ? startSimulation() : setLevelToStart()
    }
    
    func startSimulation() {
        startLabel.text = "Reset"
        removeAllPreexistingArrows()
        for ball in balls {
            ball.simulate()
        }
    }
}
