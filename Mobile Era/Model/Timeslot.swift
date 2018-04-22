//
//  Timeslot.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import ObjectMapper

public class Timeslot: Mappable {
    
    public var startTime: String = ""
    public var endTime: String = ""
    public var sessionIds: [[Int]] = []
    public var sessions: [Session] = []
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        startTime                <- map["startTime"]
        endTime                  <- map["endTime"]
        sessionIds               <- map["sessions"]
    }
    
    public init() {}
    public init(startTime: String, endTime: String, sessions: [Session]) {
        self.startTime = startTime
        self.endTime = endTime
        self.sessions = sessions
    }
}
