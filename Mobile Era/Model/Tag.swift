//
//  Tag.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import UIKit

class Tag {
    
    static func color(by name: String) -> UIColor {
        switch name {
        case "Odin":
            return UIColor.fromRGB(187, 94, 125)
        case "Freyja":
            return UIColor.fromRGB(135, 124, 176)
        case "Thon":
            return UIColor.fromRGB(64, 127, 127)
        case "Android":
            return UIColor.fromRGB(164, 198, 57)
        case "iOS":
            return UIColor.fromRGB(95, 201, 248)
        case "Cross-platform":
            return UIColor.fromRGB(179, 142, 248)
        case "Productivity":
            return UIColor.fromRGB(255, 89, 124)
        case "Mobile Web":
            return UIColor.fromRGB(140, 136, 124)
        case "Security":
            return UIColor.fromRGB(69, 69, 69)
        case "IoT":
            return UIColor.fromRGB(255, 158, 124)
        case "AI":
            return UIColor.fromRGB(242, 213, 0)
        case "Machine Learning":
            return UIColor.fromRGB(72, 31, 240)
        case "Architecture":
            return UIColor.fromRGB(253, 151, 39)
        case "Backend":
            return UIColor.fromRGB(43, 152, 240)
        case "CI":
            return UIColor.fromRGB(205, 218, 73)
        default:
            return UIColor.black
        }
    }
}
