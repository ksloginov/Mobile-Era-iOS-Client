//
//  Speaker.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation

class Speaker: Codable {
    var id: Int = 0
    var name: String = ""
    var photoUrl: String = ""
    var shortBio: String = ""
    var company: String = ""
    var country: String = ""
    var socials: [Social]?
}
