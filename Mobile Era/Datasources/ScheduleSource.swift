//
//  ScheduleSource.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import UIKit

class ScheduleSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let day = schedule[safe: section] else { return 0 }
        
        var result = 0
        
        for timeslot in day.timeslots {
            for i in 0..<timeslot.sessions.count {
                guard let session = timeslot.sessions[safe: i] else { continue }
                
                if session.isSystemAnnounce {
                    continue
                }
                
                if trackId == nil, session.isFavorite {
                    result += 1 // counting favorite talks
                }
                
                if i == trackId {
                    result += 1
                    break
                }
            }
        }
        
        return result
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    private weak var vc: UIViewController?
    private var trackId: Int? // nil == favorite-tab
    
    
    public var sessions: [Session] = []
    public var schedule: [Day] = []
    public var speakers: [Speaker] = []
    
    public init (_ vc: UIViewController, trackId: Int? = nil) {
        self.vc = vc
        self.trackId = trackId
    }
    
}
