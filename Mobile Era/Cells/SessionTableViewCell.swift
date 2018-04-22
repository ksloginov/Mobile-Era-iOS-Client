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
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var colorBarView: UIView!
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
        imgAvatar.layer.cornerRadius = 8
        imgAvatar.clipsToBounds = true
        imgAvatar.backgroundColor = R.color.selectionColor()
    }
    
    public func set(session: Session?, track: Int) {
        self.session = session

        colorBarView.layer.backgroundColor = UIColor.clear.cgColor
        if session?.isSystemAnnounce == false && session?.isWorkshop == false {
            if track == 0 {
                colorBarView.layer.backgroundColor = R.color.odinColor()?.cgColor
            } else if track == 1 {
                colorBarView.layer.backgroundColor = R.color.freyjaColor()?.cgColor
            } else if track == 2 {
                colorBarView.layer.backgroundColor = R.color.thorColor()?.cgColor
            }
        }
        
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
        
        lblSpeaker.text = (session?.speakers.map({$0.name}).joined(separator: ","))
        
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
