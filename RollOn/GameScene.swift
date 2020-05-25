import SpriteKit

let HeroBallCategory: UInt32 = 0x1 << 1
let BombBallCategory: UInt32 = 0x1 << 2
let GoalCategory: UInt32 = 0x1 << 9
let WallCategory: UInt32 = 0x1 << 10
let ToggleSwitchBlueCategory: UInt32 = 0x1 << 11
let ToggleSwitchRedCategory: UInt32 = 0x1 << 12

enum BallType { case Hero, Bomb }

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var balls: Array<Ball> = Array()
    var currentBall: Ball? = nil
    var startAndResetLabel: SKLabelNode!
    var level = LevelOne()
    let toggleSwitchCounter = ToggleSwitchCounter()
    
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
        setupStartLabel()
        level.allObjects.removeAll()
        setupLevel1()
    }
    
    func setupStartLabel() {
        startAndResetLabel = SKLabelNode(fontNamed: "Chalkduster")
        startAndResetLabel.text = "Start"
        startAndResetLabel.position = CGPoint(x: -400.0, y: 300.0)
        startAndResetLabel.zPosition = 1000
        addChild(startAndResetLabel)
    }
    
    func setupLevel1() {
        level.setupLevel()
        for object in level.allObjects {
            let node = object as! SKNode
            addChild(node)
            setupByName(node: node)
        }
    }
    
    func setupByName(node: SKNode) {
        guard let name = node.name else { return }
        if name.contains("ball") {
             setupBall(ball: node as! Ball)
        } else if name.contains("toggleSwitch") {
            setupToggleSwitch(toggleSwitch: node as! ToggleSwitch)
        }
    }
    
    func setupBall(ball: Ball) {
        balls.append(ball)
    }
    
    func setupToggleSwitch(toggleSwitch: ToggleSwitch) {
        toggleSwitchCounter.increment(ballType: toggleSwitch.acceptedBallType)
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
        
        let collisionManager = CollisionManager(nodeA: nodeA, nodeB: nodeB)
        collisionManager.handleCollision()
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
