//
//  SessionsDetailsViewController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit
import Foundation

class SessionsDetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    private var session: Session?
    
    public init(session: Session) {
        super.init(nibName: "SessionsDetailsViewController", bundle: nil)
        self.session = session
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        
        if let text = session?.title {
            let attributedText = NSMutableAttributedString (string: text)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange (location: 0, length: attributedText.length))
            lblTitle.attributedText = attributedText
        }
        
        if let text = session?.description {
            let attributedText = NSMutableAttributedString (string: text)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange (location: 0, length: attributedText.length))
            lblDescription.attributedText = attributedText
        }
    }
}

