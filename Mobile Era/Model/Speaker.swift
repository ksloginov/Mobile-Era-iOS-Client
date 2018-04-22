//
//  Speaker.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import ObjectMapper

public class Speaker: Mappable {
    
    public var id: Int = 0
    public var name: String = ""
    public var photoUrl: String = ""
    public var shortBio: String = ""
    public var company: String = ""
    public var country: String = ""
    public var socials: [Social] = []
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        photoUrl            <- map["photoUrl"]
        shortBio            <- map["shortBio"]
        company             <- map["company"]
        country             <- map["country"]
        socials             <- map["socials"]
    }

}
