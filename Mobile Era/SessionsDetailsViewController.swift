//
//  SessionsDetailsViewController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import UIKit
import Foundation
import EventKit
import EventKitUI

class SessionsDetailsViewController: BaseViewController, EKEventEditViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var tagsStackView: UIStackView!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    private lazy var eventController: EKEventEditViewController = {
        let controller = EKEventEditViewController()
        controller.eventStore = eventStore
        controller.editViewDelegate = self
        return controller
    }()
    
    private lazy var eventStore: EKEventStore = {
        return EKEventStore()
    }()
    
    private var session: Session?
    private var btnAddToCalendar, btnAddToFavorites: UIBarButtonItem?
    
    public init(session: Session) {
        super.init(nibName: "SessionsDetailsViewController", bundle: nil)
        self.session = session
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onAddToFavoritesClicked() {
        session?.toggleFavorites()
        (btnAddToFavorites?.customView as? UIButton)?.setImage(session?.isFavorite == true ? R.image.removeFromFavorites() : R.image.addToFavorites(), for: .normal)
    }
    
    @objc func onAddToCalendarClicked() {
        eventStore.requestAccess(to: .event) { [weak self] (granted, e) in
            if !granted || e != nil {
                print("An error occured: can't add event to the calendar")
                return
            }
            
            self?.addSessionToCalendar()
        }
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addSessionToCalendar() {
        guard let session = session else { return }
        
        let event = EKEvent(eventStore: eventStore)
        // set the alarm for 5 minutes from now
        event.addAlarm(EKAlarm(absoluteDate: session.date.addingTimeInterval(-5 * 60)))

        event.startDate = session.date
        event.calendar = eventStore.defaultCalendarForNewEvents
        event.endDate = session.date.addingTimeInterval(session.duration)
        event.title = session.title
        
        eventController.event = event
        present(eventController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""

        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        
        let addToCalendar = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 22))
        addToCalendar.setImage(R.image.addToCalendar(), for: .normal)
        addToCalendar.addTarget(self, action: #selector(onAddToCalendarClicked), for: .touchUpInside)

        let addToFavorites = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 22))
        addToFavorites.setImage(session?.isFavorite == true ? R.image.removeFromFavorites() : R.image.addToFavorites(), for: .normal)
        addToFavorites.addTarget(self, action: #selector(onAddToFavoritesClicked), for: .touchUpInside)
        
        btnAddToCalendar = UIBarButtonItem(customView: addToCalendar)
        btnAddToFavorites = UIBarButtonItem(customView: addToFavorites)

        navigationItem.rightBarButtonItems = [btnAddToCalendar!, btnAddToFavorites!]
        
        setData()
    }
    
    private func setData() {
        guard let session = session else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2

        let titleText = NSMutableAttributedString (string: session.title)
        titleText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange (location: 0, length: titleText.length))
        lblTitle.attributedText = titleText
        
        let descriptionText = NSMutableAttributedString (string: session.description)
        descriptionText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange (location: 0, length: descriptionText.length))
        lblDescription.attributedText = descriptionText
        
        for tag in session.tags {
            tagsStackView.addArrangedSubview(Tag.createTag(label: tag))
        }
        
        lblSubtitle.text = "October 5th / 09:00 - 10:00 / " + session.language
        
        if let photoUrl = session.speakers.first?.photoUrl, let url = URL(string: AppDelegate.domain + photoUrl) {
            imgAvatar.sd_setImage(with: url, completed: nil)
        }
    }
}

