//
//  SpeakersSource.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 15/05/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import UIKit

class SpeakersSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    public var speakers: [Speaker] = []
    private weak var vc: UIViewController?
    
    public init (_ vc: UIViewController, speakers: [Speaker]) {
        self.vc = vc
        self.speakers = speakers
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var index: [String] = []
        for name in speakers.map({$0.name}) {
            if let firstLetter = name.first, !index.contains(firstLetter.description) {
                index.append(firstLetter.description)
            }
        }
        
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SpeakerTableViewCell.key) as? SpeakerTableViewCell {
            cell.set(speaker: speakers[safe: indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    public func setData(_ speakers: [Speaker]) {
        self.speakers = speakers
    }
}

