//
//  Day.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import ObjectMapper

public class Day: Mappable {
    
    public var date: String = ""
    public var dateReadable: String = ""
    public var tracks: [Track] = []
    public var timeslots: [Timeslot] = []
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        date                  <- map["date"]
        dateReadable          <- map["dateReadable"]
        tracks                <- map["tracks"]
        timeslots             <- map["timeslots"]
    }
}
