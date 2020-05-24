import SpriteKit

class GameScene: SKScene {
    
    var balls: Array<Ball> = Array()
    var currentBall: Ball? = nil
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = .zero
        setupBackground()
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
            if let object = nodes(at: location).first as? Ball {
                let ball = balls.first(where: { $0.name == object.name } )
                ball?.physicsBody?.isDynamic = false
                ball?.startLocation = location
                currentBall = ball
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let cb = currentBall {
            if let node = childNode(withName: "arrow") {
                removeChildren(in: [node])
            }
        }
            
        if let touch = touches.first {
            if let cb = currentBall {
                cb.arrow.touchLocation = touch.location(in: self)
                let drawnArrow = cb.arrow
                drawnArrow.name = "arrow"
                addChild(drawnArrow)
            }
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
        startSimulation()
    }
    
    func startSimulation() {
        for ball in balls {
            ball.simulate()
        }
    }
}
