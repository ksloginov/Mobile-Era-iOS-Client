//
//  Social.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import ObjectMapper

public class Social: Mappable {
    
    public var icon: String = "" // website, twitter, github, ..
    public var name: String = ""
    public var link: String = ""
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        icon                  <- map["icon"]
        name                  <- map["name"]
        link                  <- map["link"]
    }
    
}
