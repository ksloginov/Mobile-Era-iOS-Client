//
//  Session.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation

class Session2: Codable {
    
    //private var KEY_FAVORITE_SESSION: String = "KEY_FAVORITE_SESSION_"
    
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var image: String?
    var language: String?
    var lightning: Bool?
    
    var tags: [String]?
    var price: String?
}

class Session: Codable {
    
    private static let KEY_FAVORITE_SESSION: String = "KEY_FAVORITE_SESSION_"
    
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var image: String?
    var language: String?
    var lightning: Bool?
    var speakers: [Int]?
    var speakersList: [Speaker]?
    var tags: [String]?
    var price: String?
    
    var startDate: Date?
    var endDate: Date?
    var duration: TimeInterval {
        guard let startDate = startDate, let endDate = endDate else { return 0 }
        return endDate.timeIntervalSince(startDate)
    }
    
    var isWorkshop: Bool {
        return id >= 400 && id < 500
    }
    
    var isSystemAnnounce: Bool {
        return id >= 900
    }
    
    var isFavorite: Bool {
        if isSystemAnnounce {
            return false // lunch, system announce, etc.
        }
        
        return UserDefaults.standard.bool (forKey: Session.KEY_FAVORITE_SESSION + id.description)
    }
    
    func toggleFavorites() {
        if isSystemAnnounce {
            return
        }
        
        let oldValue = isFavorite
        UserDefaults.standard.set(!oldValue, forKey: Session.KEY_FAVORITE_SESSION + id.description)
    }
}
