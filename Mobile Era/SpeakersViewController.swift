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
import ObjectMapper

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
                let speakers = Mapper<Speaker>().mapArray(JSONObject: snapshot.childSnapshot(forPath: "speakers").value) else {
                    print("Error parsing data from Firebase")
                    return
            }

            self?.speakersSource?.setData(speakers)
            self?.tableView.reloadData()
        }
    }
}

