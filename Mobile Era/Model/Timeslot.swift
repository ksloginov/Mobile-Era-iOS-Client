//
//  Timeslot.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation

class Timeslot: Codable {

    var startTime: String = ""
    var endTime: String = ""
    var sessions: [[Int]] = []
    var sessionsList: [Session]?

    init() {}
    init(startTime: String, endTime: String, sessionsList: [Session]?) {
        self.startTime = startTime
        self.endTime = endTime
        self.sessionsList = sessionsList
    }
}
