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
    public var image: String = ""
    public var language: String = ""
    public var lightning: Bool = false
    public var speakerIds: [Int] = []
    public var speakers: [Speaker] = []
    public var tags: [String] = []
    public var price: String = ""
    
    public var startDate: Date?
    public var endDate: Date?
    public var duration: TimeInterval {
        guard let startDate = startDate, let endDate = endDate else { return 0 }
        return endDate.timeIntervalSince(startDate)
    }
    
    public var isWorkshop: Bool {
        return id >= 400 && id < 500
    }
    
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
        lightning           <- map["lightning"]
        image               <- map["image"]
        language            <- map["language"]
        speakerIds          <- map["speakers"]
        tags                <- map["tags"]
    }

    
}
