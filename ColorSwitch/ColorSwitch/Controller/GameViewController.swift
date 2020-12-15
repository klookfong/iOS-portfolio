//
//  GameViewController.swift
//  ColorSwitch
//
//  Created by Kyle L. on 12/11/20.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            
            ///DEBUG OPTIONS
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    
}
