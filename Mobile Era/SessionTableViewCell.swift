//
//  SessionTableViewCell.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit

class SessionTableViewCell: UICustomTableViewCell {

    public static let key = "SessionTableViewCell"
    public static let nib: UINib = UINib(nibName: key, bundle: Bundle.main)
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
