import SpriteKit

let HeroBallCategory: UInt32 = 0x1 << 1
let BombBallCategory: UInt32 = 0x1 << 2
let BombBallSecondaryEffectFieldCategory: UInt32 = 0x1 << 3
let GhostBallCategory: UInt32 = 0x1 << 4
let AbsorbBallCategory: UInt32 = 0x1 << 5
let ToggleSwitchBlueCategory: UInt32 = 0x1 << 11
let ToggleSwitchRedCategory: UInt32 = 0x1 << 12
let ToggleSwitchGrayCategory: UInt32 = 0x1 << 13
let ToggleSwitchWhiteCategory: UInt32 = 0x1 << 14
let ToggleWallCategory: UInt32 = 0x1 << 15
let GoalCategory: UInt32 = 0x1 << 24
let WallCategory: UInt32 = 0x1 << 25
let SpikesCategory: UInt32 = 0x1 << 26
let BouncerCategory: UInt32 = 0x1 << 27
let GhostWallCategory: UInt32 = 0x1 << 28

class GameScene: SKScene, SKPhysicsContactDelegate, ToggleSwitchCounterDelegate, GoalReachedDelegate {
    
    var balls: Array<Ball> = Array()
    var currentBall: Ball? = nil
    let startAndResetLabel = StartAndResetLabel()
    let nextLevelLabel = NextLevelLabel()
    let levelManager = LevelManager()
    var level = Level()
    let collisionManager = CollisionManager()

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        collisionManager.toggleSwitchCounterDelegate = self
        collisionManager.goalReachedDelegate = self
        setLevelToStart()
    }
    
    func setLevelToStart() {
        level = levelManager.getCurrentLevel()
        removeAllChildren()
        balls.removeAll()
        currentBall = nil
        startAndResetLabel.text = "Start"
        addChild(startAndResetLabel)
        nextLevelLabel.isHidden = true
        addChild(nextLevelLabel)
        collisionManager.resetToggleCounter()
        level.allObjects.removeAll()
        setupLevel()
    }
    
    func setupLevel() {
        level.setupLevel()
        if !level.hasSeenName { level.displayName() }
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
        collisionManager.toggleSwitchCounter.increment(ballType: toggleSwitch.acceptedBallType)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if nodes(at: location).contains(startAndResetLabel) {
                startOrResetClicked()
            } else if nodes(at: location).contains(nextLevelLabel) {
                nextLevelClicked()
            } else {
                ballTouched(location: location)
            }
        }
    }
    
    func startOrResetClicked() {
        let shouldStart = startAndResetLabel.shouldStart()
        shouldStart ? startSimulation() : setLevelToStart()
    }
    
    func nextLevelClicked() {
        level = levelManager.nextLevel()
        setLevelToStart()
    }
    
    func ballTouched(location: CGPoint) {
        if let object = nodes(at: location).first as? Ball {
            if let ball = balls.first(where: { $0.name == object.name } ) {
                ball.startLocation = ball.position
                ball.runSecondaryEffect()
                currentBall = ball
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            drawArrow(location: location)
        }
    }
    
    private func drawArrow(location: CGPoint) {
        if currentBall != nil {
        let cb = balls.first(where: { $0.name == currentBall?.name } )
            cb?.drawArrow(location: location)
        }
    }
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            ballTouchEnded(location: location)
        }
    }
    
    func ballTouchEnded(location: CGPoint) {
        if currentBall != nil {
            let cb = balls.first(where: { $0.name == currentBall?.name } )
            cb?.endLocation = location
            currentBall = nil
        }
    }
    
    func startSimulation() {
        startAndResetLabel.text = "Reset"
        for ball in balls {
            ball.simulate()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        collisionManager.handleCollision(nodeA: nodeA, nodeB: nodeB)
    }
    
    func toggleCounterHitZero(for ballType: BallType) {
        removeAllToggleSwitchesByBallType(ballType: ballType)
    }
    
    func goalReached() {
        nextLevelLabel.isHidden = false
    }
    
    private func removeAllToggleSwitchesByBallType(ballType: BallType) {
        for child in children {
            if let isToggleWall = child.name?.contains("toggleWall") {
                if isToggleWall {
                    let toggleWall = child as! ToggleWall
                    if toggleWall.acceptedBallType == ballType {
                        toggleWall.removeFromParent()
                    }
                }
            }
        }
    }
}
