//
//  FirstViewController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var scheduleSource: ScheduleSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizable.schedule()
        
        scheduleSource = ScheduleSource(self, trackId: 0)
        tableView.dataSource = scheduleSource
        tableView.delegate = scheduleSource
        tableView.register(SessionTableViewCell.nib, forCellReuseIdentifier: SessionTableViewCell.key)
        tableView.isDirectionalLockEnabled = true
        tableView.separatorStyle = .none
        
        loadData()
    }
    
    private func loadData() {
        
    }
}

