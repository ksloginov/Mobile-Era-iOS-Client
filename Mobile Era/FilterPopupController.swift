//
//  FilterPopupController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 24/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import UIKit

class FilterPopupController: UIViewController {
    
    @IBOutlet weak var lblFilter: UILabel!
    @IBOutlet weak var lblOnlyFavorites: UILabel!
    @IBOutlet weak var imgOnlyFavorites: UIImageView!
    @IBOutlet weak var btnClearFilter: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    
    @IBOutlet weak var tagsContainer: UIView!
    @IBOutlet weak var tagsContainerHeightConstraint: NSLayoutConstraint!
    @IBAction func onDismissPopupClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onShowOnlyFavoritesClicked(_ sender: Any) {
        SettingsDataManager.instance.toggleShowOnlyFavorites()
        updateState()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notification.FILTER_NOTIFICATION), object: [])
    }
    
    @objc func onTagClicked(_ sender: Any) {
        guard let tag = (sender as? Tag)?.currentTitle else { return }
        
        let manager = SettingsDataManager.instance
        
        if manager.selectedTags.contains(tag) {
            manager.selectedTags = manager.selectedTags.filter({$0 != tag})
        } else {
            manager.selectedTags.append(tag)
        }
        
        updateState()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notification.FILTER_NOTIFICATION), object: [])
    }
    
    @IBAction func onClearFiltersClicked(_ sender: Any) {
        let manager = SettingsDataManager.instance
        
        manager.showOnlyFavorite = false
        manager.selectedTags = []
        
        updateState()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notification.FILTER_NOTIFICATION), object: [])
    }
    
    @IBOutlet weak var viewContainer: UIView!
    
    private var tagsContainerWidth: CGFloat {
        return min(440, view.frame.width * 0.8) - 15 * 2
    }
    
    public init() {
        super.init(nibName: "FilterPopupController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer.layer.cornerRadius = 8
        viewContainer.layer.borderColor = R.color.separatorColor()?.cgColor
        viewContainer.layer.borderWidth = 1
        viewContainer.clipsToBounds = true
        
        lblFilter.text = R.string.localizable.filter()
        lblOnlyFavorites.text = R.string.localizable.only_favorite_sessions()

        for label in SettingsDataManager.instance.allTags {
            let tag = Tag.createTag(label: label, fontSize: 14)
            tag.addTarget(self, action: #selector(onTagClicked), for: .touchUpInside)
            tag.translatesAutoresizingMaskIntoConstraints = false
            tag.widthAnchor.constraint(equalToConstant: tag.frame.width)
            tag.heightAnchor.constraint(equalToConstant: tag.frame.height)
            tagsContainer.addSubview(tag)
        }
        
        updateState()
        realignTags(containerWidth: tagsContainerWidth)
    }
    
    private func updateState() {
        imgOnlyFavorites.image = SettingsDataManager.instance.showOnlyFavorite ? R.image.checkboxChecked() : R.image.checkboxUnchecked()
        for tag in tagsContainer.subviews {
            if let label = (tag as? Tag)?.currentTitle {
                tag.alpha = SettingsDataManager.instance.selectedTags.isEmpty || SettingsDataManager.instance.selectedTags.contains(label) ? 1 : 0.25
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        realignTags(containerWidth: tagsContainerWidth)
    }
    
    private func realignTags(containerWidth: CGFloat) {
        
        if tagsContainer.subviews.isEmpty {
            return
        }
        
        tagsContainer.constraints.forEach({
            if $0 != tagsContainerHeightConstraint {
                $0.isActive = false
            }
        })
        
        var tag = tagsContainer.subviews[0]
        tag.topAnchor.constraint(equalTo: tagsContainer.topAnchor, constant: 0).isActive = true
        tag.leadingAnchor.constraint(equalTo: tagsContainer.leadingAnchor, constant: 0).isActive = true
        tagsContainer.layoutIfNeeded()
        
        for i in 1..<tagsContainer.subviews.count {
            tag = tagsContainer.subviews[i]
            let lastTag = tagsContainer.subviews[i - 1]
            
            if lastTag.frame.maxX + (tag.frame.width + 8) < containerWidth {
                tag.centerYAnchor.constraint(equalTo: lastTag.centerYAnchor).isActive = true
                tag.leadingAnchor.constraint(equalTo: lastTag.trailingAnchor, constant: 8).isActive = true
            } else {
                tag.topAnchor.constraint(equalTo: lastTag.bottomAnchor, constant: 8).isActive = true
                tag.leadingAnchor.constraint(equalTo: tagsContainer.leadingAnchor, constant: 0).isActive = true
            }
            
            tagsContainer.layoutIfNeeded()
        }
        
        tagsContainerHeightConstraint.constant = tagsContainer.subviews.last!.frame.maxY
    }
}
