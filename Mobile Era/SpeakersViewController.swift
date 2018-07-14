//
//  SecondViewController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase

extension Decodable {
    /// Initialize from JSON Dictionary. Return nil on failure
    init?(dictionary value: [String:Any]){
        
        guard JSONSerialization.isValidJSONObject(value) else { return nil }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) else { return nil }
        
        guard let newValue = try? JSONDecoder().decode(Self.self, from: jsonData) else { return nil }
        self = newValue
    }
}

class SpeakersViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var database: DatabaseReference!
    
    private var speakersSource: SpeakersSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
        database.keepSynced(true)
        
        title = R.string.localizable.speakers()
        
        speakersSource = SpeakersSource(self, speakers: [])
        tableView.dataSource = speakersSource
        tableView.delegate = speakersSource
        tableView.register(SpeakerTableViewCell.nib, forCellReuseIdentifier: SpeakerTableViewCell.key)
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        
        loadData()
    }
    
    private func loadData() {
        database.observe(.value) { [weak self] (snapshot) in
            guard
                let speakersSnapshot = snapshot.childSnapshot(forPath: "speakers").value,
                let instructorsSnapshot = snapshot.childSnapshot(forPath: "instructors").value,
                JSONSerialization.isValidJSONObject(speakersSnapshot),
                JSONSerialization.isValidJSONObject(instructorsSnapshot),
                let speakersData = try? JSONSerialization.data(withJSONObject: speakersSnapshot, options: []),
                let instructorsData = try? JSONSerialization.data(withJSONObject: instructorsSnapshot, options: []),
                var speakers = try? JSONDecoder().decode([Speaker].self, from: speakersData),
                let instructors = try? JSONDecoder().decode([Speaker].self, from: instructorsData) else {
                    print("Error parsing data from Firebase")
                    return
            }

            for instructor in instructors {
                // Minor hack to avoid data-duplication: in ME-db, instructors have different IDs (i.e. we have 2 "copies" of Wei Meng or Svetlana. With 2XX and 3XX ids each)
                if !speakers.contains(where: {$0.name == instructor.name}) {
                    speakers.append(instructor)
                }
            }
            
            self?.speakersSource?.setData(speakers)
            self?.tableView.reloadData()
        }
    }
}

