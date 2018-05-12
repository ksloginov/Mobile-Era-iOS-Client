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
    
    var filterBtn: UIBarButtonItem?
    @IBOutlet weak var daySegmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    private var scheduleSource: ScheduleSource?
    
    private var selectedTags: [String] = [] {
        didSet {
            scheduleSource?.selectedTags = selectedTags
        }
    }
    
    private var showOnlyFavorite: Bool = false {
        didSet {
            scheduleSource?.showOnlyFavorite = showOnlyFavorite
        }
    }
    
    var database: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
        database.keepSynced(true)
        
        title = R.string.localizable.schedule()
        
        scheduleSource = ScheduleSource(self, selectedDay: daySegmentControl.selectedSegmentIndex)
        tableView.dataSource = scheduleSource
        tableView.delegate = scheduleSource
        tableView.register(SessionTableViewCell.nib, forCellReuseIdentifier: SessionTableViewCell.key)
        tableView.register(SessionTableViewLegendCell.nib, forCellReuseIdentifier: SessionTableViewLegendCell.key)
        tableView.register(SessionTableViewHeader.nib, forHeaderFooterViewReuseIdentifier: SessionTableViewHeader.key)
        tableView.isDirectionalLockEnabled = true
        tableView.separatorStyle = .none
        
        loadData()
        
        createFilterButton()
        updateFilterBadgeCount()
    }
    
    @objc func onFilterClicked() {
        guard let sessions = scheduleSource?.allSessions else { return }
        var allTags: Set<String> = []
        for session in sessions {
            session.tags.forEach({allTags.insert($0)})
        }
        
        SettingsDataManager.instance.allTags = Array(allTags)
        
        let filterPopup = FilterPopupController()
        filterPopup.modalTransitionStyle = .crossDissolve
        filterPopup.modalPresentationStyle = .overFullScreen
        present(filterPopup, animated: true, completion: nil)
    }
    
    
    
    public func createFilterButton() {
        let filterIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
        filterIcon.setImage(R.image.filter(), for: .normal)
        filterIcon.addTarget(self, action: #selector(onFilterClicked), for: .touchUpInside)
        
        let badge = UILabel(frame: CGRect(x: 14, y: -4, width: 16, height: 16))
        badge.layer.cornerRadius = badge.bounds.size.height / 2
        badge.textAlignment = .center
        badge.clipsToBounds = true
        badge.textColor = .white
        badge.font = UIFont.boldSystemFont(ofSize: 11)
        badge.backgroundColor = .red
        badge.tag = BADGE_TAG
        badge.isHidden = true
        filterIcon.addSubview(badge)
        
        filterBtn = UIBarButtonItem.init(customView: filterIcon)
        navigationItem.leftBarButtonItem = filterBtn
    }
    
    private let BADGE_TAG = 24042018
    
    public func updateFilterBadgeCount() {
        guard let badge = (filterBtn?.customView?.subviews.first(where: {$0.tag == BADGE_TAG}) as? UILabel) else { return }
        
        let badgeCount = selectedTags.count + (showOnlyFavorite ? 1 : 0)
        badge.text = badgeCount.description
        badge.isHidden = badgeCount == 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFilterBadgeCount()
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

