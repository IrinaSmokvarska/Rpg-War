//
//  DevilWizard.swift
//  rpgOOP
//
//  Created by Darko Spasovski on 2/3/16.
//  Copyright © 2016 Darko Spasovski. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}