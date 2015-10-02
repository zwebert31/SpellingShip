//
//  Extensions.swift
//  SpellingShip
//
//  Created by Zachary Webert on 9/22/15.
//  Copyright © 2015 Zachary Webert. All rights reserved.
//

import SpriteKit

extension CGVector {
    func magnitude() -> CGFloat {
        return sqrt(dx*dx + dy*dy)
    }
}
