//
//  Ship.swift
//  SpellingShip
//
//  Created by Zachary Webert on 9/22/15.
//  Copyright © 2015 Zachary Webert. All rights reserved.
//

import SpriteKit

class Ship: SKSpriteNode {
    
    let MAX_V: CGFloat = 500
    let THRUST: CGFloat = 500
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addChild(thrustEmitter)
        thrustEmitter.position = CGPointMake(0, -0.5 * self.size.height)
        self.thrustEmitter.particleBirthRate = 0
    }
    
    let thrustEmitter: SKEmitterNode = SKEmitterNode(fileNamed: "thrust")!
    var thrustOn: Bool = false {
        didSet {
            if thrustOn {
                self.thrustEmitter.particleBirthRate = 2000
            } else {
                self.thrustEmitter.particleBirthRate = 0
            }
        }
    }
    
    func rotateToTouch(touch: UITouch) {
        guard let parent = self.parent else {
            return
        }
        
        let angle = atan2(touch.locationInNode(parent).y - self.position.y, touch.locationInNode(parent).x - self.position.x) - CGFloat(M_PI_2);

        let rotateAction = SKAction.rotateToAngle(angle, duration: 0.1, shortestUnitArc: true)
        rotateAction.timingMode = SKActionTimingMode.EaseOut
        self.runAction(rotateAction)
        
        self.physicsBody?.angularVelocity = 0
    }
    
    func applyThrust() {
        let rotation: CGFloat = self.zRotation + CGFloat(M_PI_2);
        let v = CGVectorMake(THRUST * cos(rotation), THRUST * sin(rotation))
        self.physicsBody?.applyForce(v)
    }
    
    func update(currentTime: CFTimeInterval) {
        if self.thrustOn {
            self.applyThrust()
        }

    }
    
}
