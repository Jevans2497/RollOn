import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        setupBackground()
//        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
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
        let ball = Ball(color: "Blue", position: position)
        addChild(ball)
    }

//    func setupLevel1() {
//         let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
//         let position = CGPoint(x: 150 + leftmost, y: 0.0)
//         let ball = SKSpriteNode(imageNamed: <#T##String#>)
//         addChild(ball)
//     }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            handleTouch(touch: touch)
//        }
    }
    
    private func handleTouch(touch: UITouch) {
        let location = touch.location(in: self)
//        if nodes(at: location)
    }
}
