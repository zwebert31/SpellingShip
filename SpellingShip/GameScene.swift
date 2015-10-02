//
//  GameScene.swift
//  SpellingShip
//
//  Created by Zachary Webert on 9/22/15.
//  Copyright (c) 2015 Zachary Webert. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var ship: Ship!
    
    override func didMoveToView(view: SKView) {
        let camera = SKCameraNode()
        
        self.addChild(camera)
        
        self.camera = camera
        self.anchorPoint = CGPointMake(0.5, 0.5)
        self.ship = self.childNodeWithName("ship") as! Ship
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.ship.rotateToTouch(touch)
        self.ship.thrustOn = true
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.ship.rotateToTouch(touch)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.ship.thrustOn = false
    }

    override func update(currentTime: CFTimeInterval) {
        self.ship.update(currentTime)
        self.camera?.runAction(SKAction.moveTo(ship.position, duration: 0.15))
        /* Called before each frame is rendered */
    }
    
    
}
