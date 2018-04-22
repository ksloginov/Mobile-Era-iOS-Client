//
//  Session.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import ObjectMapper

public class Session: Mappable {
    
    private var KEY_FAVORITE_SESSION: String = "KEY_FAVORITE_SESSION_"
    
    public var id: Int = 0
    public var title: String = ""
    public var description: String = ""
    public var language: String = ""
    public var speakers: [Speaker] = []
    public var tags: [String] = []
    
    public var isSystemAnnounce: Bool {
        return id >= 900
    }
    
    public var isFavorite: Bool {
        if isSystemAnnounce {
            return false // lunch, system announce, etc.
        }
        
        return UserDefaults.standard.bool (forKey: KEY_FAVORITE_SESSION + id.description)
    }
    
    public func toggleFavorites() {
        if isSystemAnnounce {
            return
        }
        
        let oldValue = isFavorite
        UserDefaults.standard.set(!oldValue, forKey: KEY_FAVORITE_SESSION + id.description)
    }
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id                  <- map["id"]
        title               <- map["title"]
        description         <- map["description"]
        language            <- map["language"]
        speakers            <- map["speakers"]
        tags                <- map["tags"]
    }

    
}
