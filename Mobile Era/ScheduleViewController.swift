//
//  FirstViewController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import ObjectMapper

class ScheduleViewController: UIViewController {
    @IBAction func onSegmentControlValueChanged(_ sender: Any) {
        scheduleSource?.setSelectedDay(daySegmentControl.selectedSegmentIndex)
        tableView.reloadData()
    }
    
    @IBOutlet weak var daySegmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    private var scheduleSource: ScheduleSource?
    
    var database: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
        title = R.string.localizable.schedule()
        
        scheduleSource = ScheduleSource(self, selectedDay: daySegmentControl.selectedSegmentIndex)
        tableView.dataSource = scheduleSource
        tableView.delegate = scheduleSource
        tableView.register(SessionTableViewCell.nib, forCellReuseIdentifier: SessionTableViewCell.key)
        tableView.register(SessionTableViewHeader.nib, forHeaderFooterViewReuseIdentifier: SessionTableViewHeader.key)
        tableView.isDirectionalLockEnabled = true
        tableView.separatorStyle = .none
        
        loadData()
    }
    
    private func loadData() {
        database.observe(.value) { [weak self] (snapshot) in
            guard
                let speakers = Mapper<Speaker>().mapArray(JSONObject: snapshot.childSnapshot(forPath: "speakers").value),
                let sessionsDictionary = Mapper<Session>().mapDictionary(JSONObject: snapshot.childSnapshot(forPath: "sessions").value),
                let workshopsDictionary = Mapper<Session>().mapDictionary(JSONObject: snapshot.childSnapshot(forPath: "workshops").value),
                let schedule = Mapper<Day>().mapArray(JSONObject: snapshot.childSnapshot(forPath: "schedule").value) else {
                    print("Error parsing data from Firebase")
                    return
            }
            
            let sessions = Array(sessionsDictionary.values) + Array(workshopsDictionary.values)
            

            for session in sessions {
                var joinedSpeakerList: [Speaker] = []
                for id in session.speakerIds {
                    if let joinedSpeaker = speakers.first(where: {$0.id == id}) {
                        joinedSpeakerList.append(joinedSpeaker)
                    }
                }
                
                session.speakers = joinedSpeakerList
            }
            
            for day in schedule {
                for timeslot in day.timeslots {
                    var joinedSessionsList: [Session] = []
                    for id in timeslot.sessionIds.map({$0.first}) {
                        if let joinedSession = sessions.first(where: {$0.id == id}) {
                            joinedSessionsList.append(joinedSession)
                        }
                    }
                    
                    timeslot.sessions = joinedSessionsList
                }
            }
            
            self?.scheduleSource?.setData(allSessions: sessions, schedule: schedule)
            self?.tableView.reloadData()
        }
    }
}

