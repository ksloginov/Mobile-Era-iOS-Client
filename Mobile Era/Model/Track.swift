//
//  Track.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import ObjectMapper

public class Track: Mappable {
    
    public var title: String = ""
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        title                  <- map["title"]
    }
}
