//
//  SessionTableViewCell.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit
import SDWebImage

class SessionTableViewCell: UICustomTableViewCell {
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var btnStar: UIButton!
    
    @IBAction func onStarClicked(_ sender: Any) {
        session?.toggleFavorites()
        btnStar.setImage(session?.isFavorite == true ? R.image.star_filled() : R.image.star(), for: .normal)
    }
    
    public static let key = "SessionTableViewCell"
    public static let nib: UINib = UINib(nibName: key, bundle: Bundle.main)
    
    private var session: Session?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgAvatar.layer.cornerRadius = 8
        imgAvatar.backgroundColor = R.color.selectionColor()
    }
    
    public func set(session: Session?) {
        self.session = session
        
        separatorHeight.constant = 0.5
        
        lblTitle.text = session?.title
        btnStar.isHidden = session?.isSystemAnnounce == true
        btnStar.setImage(session?.isFavorite == true ? R.image.star_filled() : R.image.star(), for: .normal)
        
        
        if let photoUrl = session?.speakers.first?.photoUrl, let url = URL(string: AppDelegate.domain + photoUrl) {
            imgAvatar.sd_setImage(with: url, completed: nil)
        } else {
            imgAvatar.image = nil
        }
    }
    
}
