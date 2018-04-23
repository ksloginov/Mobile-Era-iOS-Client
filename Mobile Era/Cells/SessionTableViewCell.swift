//
//  SessionTableViewCell.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class SessionTableViewCell: UICustomTableViewCell {
    @IBOutlet weak var tagsStackView: UIStackView!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSpeaker: UILabel!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblExtraAvatarsCount: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var colorBarView: UIView!
    @IBOutlet weak var imgAvatarContainer: UIView!
    @IBOutlet weak var bottomAvatarConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomSpeakerConstraint: NSLayoutConstraint!
    
    @IBAction func onStarClicked(_ sender: Any) {
        session?.toggleFavorites()
        btnStar.setImage(session?.isFavorite == true ? R.image.star_filled() : R.image.star(), for: .normal)
    }
    
    public static let key = "SessionTableViewCell"
    public static let nib: UINib = UINib(nibName: key, bundle: Bundle.main)
    
    private var session: Session?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        imgAvatarContainer.layer.cornerRadius = 8
        imgAvatarContainer.clipsToBounds = true
        
        
        lblExtraAvatarsCount.layer.cornerRadius = 2
        lblExtraAvatarsCount.clipsToBounds = true
    }
    
    public func set(session: Session?, track: Int) {
        self.session = session
        
        selectionStyle = session?.isSystemAnnounce == true ? .none : .default

        var trackName: String = ""
        colorBarView.layer.backgroundColor = UIColor.clear.cgColor
        if session?.isSystemAnnounce == false && session?.isWorkshop == false {
            if track == 0 {
                colorBarView.layer.backgroundColor = R.color.odinColor()?.cgColor
                trackName = "| Odin"
            } else if track == 1 {
                colorBarView.layer.backgroundColor = R.color.freyjaColor()?.cgColor
                trackName = "| Freyja"
            } else if track == 2 {
                colorBarView.layer.backgroundColor = R.color.thorColor()?.cgColor
                trackName = "| Thor"
            }
        }
        
        lblRoomName.text = trackName
        
        separatorHeight.constant = 0.5
        lblTitle.text = ""
        if let session = session {
            let text = session.title + (session.lightning ? " ⚡" : "")
            let attributedText = NSMutableAttributedString (string: text)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 2
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange (location: 0, length: attributedText.length))
            lblTitle.attributedText = attributedText
        }
        
        lblSpeaker.text = (session?.speakers.map({$0.name}).joined(separator: ", "))
        
        if let speakersCount = session?.speakers.count, speakersCount > 1 {
            lblExtraAvatarsCount.isHidden = false
            lblExtraAvatarsCount.text = "+" + (speakersCount - 1).description
        } else {
            lblExtraAvatarsCount.isHidden = true
        }
        
        btnStar.isHidden = session?.isSystemAnnounce == true
        btnStar.setImage(session?.isFavorite == true ? R.image.star_filled() : R.image.star(), for: .normal)
        
        if let photoUrl = session?.speakers.first?.photoUrl, let url = URL(string: AppDelegate.domain + photoUrl) {
            imgAvatar.sd_setImage(with: url, completed: nil)
        } else if let sessionUrl = session?.image, let url = URL(string: AppDelegate.domain + sessionUrl) {
            imgAvatar.sd_setImage(with: url, completed: nil)
        } else {
            imgAvatar.image = nil
        }
        
        tagsStackView.subviews.forEach({$0.removeFromSuperview()})
        if let tags = session?.tags {
            for tag in tags {
                let label = UILabelPadding()
                label.text = tag
                label.textColor = UIColor.white
                label.layer.backgroundColor = Tag.color(by: tag).cgColor
                label.font = UIFont.systemFont(ofSize: CGFloat(12), weight: UIFont.Weight.semibold)
                tagsStackView.addArrangedSubview(label)
                label.sizeToFit()
                label.layer.cornerRadius = label.frame.height / 2
                label.clipsToBounds = true
            }
        }
        
        let hasFooter = session?.tags.isEmpty == false || session?.isSystemAnnounce == false
        
        bottomAvatarConstraint.constant = hasFooter ? 36 : 8
        bottomSpeakerConstraint.constant = hasFooter ? 36 : 8
    }
    
}
