//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Kyle L. on 12/11/20.
//

import SpriteKit

class GameScene: SKScene {
    
    var CircleColor = ColorState.green
    var currIndex: Int?
    let colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0
    
    override func didMove(to view: SKView) {
        self.layoutScene()
    }
    
    func layoutScene(){
        self.view?.subviews.forEach({$0.removeFromSuperview()})
        self.backgroundColor = UIColor.darkGray
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        self.physicsWorld.contactDelegate = self
        scoreLabel.fontName = "Arial"
        scoreLabel.fontSize = 60.0
        scoreLabel.fontColor = .white
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(scoreLabel)
        self.addBall()
        self.addColorSwitch()
    }
    
    func addColorSwitch(){
        colorSwitch.size = CGSize(width: self.frame.size.width / 2.66, height: self.frame.size.height / 4)
        colorSwitch.position = CGPoint(x: self.frame.midX, y: self.frame.minY + colorSwitch.size.height)
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width / 2)
        colorSwitch.physicsBody?.categoryBitMask = Phy.color
        colorSwitch.physicsBody?.isDynamic = false
        self.addChild(colorSwitch)
    }
    
    func addBall(){
        self.currIndex = [0,1,2,3].randomElement() ?? 0
        let texture = SKTexture(imageNamed: "Ball")
        let color = BallColors.colors[currIndex ?? 0]
        let size = CGSize(width: 30.0, height: 30.0)
        let ball = SKSpriteNode(texture: texture, color: color, size: size)
        ball.colorBlendFactor = 1
        ball.name = "Ball"
        ball.position = CGPoint(x: self.frame.midX, y: self.frame.maxY)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        ball.physicsBody?.categoryBitMask = Phy.ball
        ball.physicsBody?.contactTestBitMask = Phy.color
        ball.physicsBody?.collisionBitMask = Phy.none
        self.addChild(ball)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.turnWheel()
    }
    
}


extension GameScene : SKPhysicsContactDelegate{
    //when contact is registered
    func didBegin(_ contact: SKPhysicsContact) {
                //combining both the contact of A and B
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if contactMask == Phy.ball | Phy.color{
            if let ball = contact.bodyA.node?.name == "Ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode{
                if self.currIndex == self.CircleColor.rawValue{
                    ball.run(SKAction.fadeOut(withDuration: 0.25)) {
                        self.updateScore()
                        ball.removeFromParent()
                        self.addBall()
                    }
                }else{
                    self.gameOver()
                    
                }
            }
        }
    }
    
    
    func turnWheel(){
        if let newColor = ColorState(rawValue: self.CircleColor.rawValue + 1){
            self.CircleColor = newColor
        }else{
            self.CircleColor = .green
        }
        colorSwitch.run(SKAction.rotate(byAngle: .pi/2, duration: 0.25))
    }
    
    func gameOver(){
        self.score = 0
        self.scoreLabel.text = "\(self.score)"
        self.removeAllChildren()
        let resetButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width / 2, height: frame.height / 2), primaryAction: UIAction(handler: { (_) in
                self.layoutScene()
        }))
        resetButton.setTitle("Reset", for: .normal)
        resetButton.titleLabel?.font = UIFont(name: "arial", size: 40)
        self.view?.addSubview(resetButton)
    }
    
    func updateScore(){
        self.score += 1
        scoreLabel.text = "\(self.score)"
    }
    
    func removeResetButton(button: UIButton){
        button.removeFromSuperview()
    }
}
