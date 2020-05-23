import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        setupBackground()
        setupLevel1()
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "mountain.png")
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
        addChild(ball)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if let object = nodes(at: location).first {
                handleTouchByObjectType(object: object)
            }
        }
    }
    
    func handleTouchByObjectType(object: Any) {
        if let ball = object as? Ball {
            ballTouched(ball: ball)
        }
    }
    
    func ballTouched(ball: Ball) {
        if let ballColor = ball.name?.split(separator: "_").first {
            switch ballColor {
            case "Blue":
                blueBallTouched(ball: ball)
            default:
                print("Something else")
            }
        }
    }
    
    func blueBallTouched(ball: Ball) {
        ball.physicsBody?.isDynamic = true
        
    }
}
