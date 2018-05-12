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
    
    @IBAction func onClearFiltersClicked(_ sender: Any) {
        SettingsDataManager.instance.showOnlyFavorite = false
        SettingsDataManager.instance.selectedTags = []
        updateState()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notification.FILTER_NOTIFICATION), object: [])
    }
    
    @IBOutlet weak var viewContainer: UIView!
    
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
        
        updateState()
        updateTagsFilter(width: min(440, view.frame.width))
    }
    
    private func updateState() {
        imgOnlyFavorites.image = SettingsDataManager.instance.showOnlyFavorite ? R.image.checkboxChecked() : R.image.checkboxUnchecked()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateTagsFilter(width: min(440, size.width))
    }
    
    private func updateTagsFilter(width: CGFloat) {
        let allTags = SettingsDataManager.instance.allTags
        
        var currentXPosition: CGFloat = 0
        var lines: CGFloat = 0
        
        tagsContainer.subviews.forEach({$0.removeFromSuperview()})
        
        var horizontalStack = createStackView()
        
        for label in allTags {
            let tag = Tag.createTag(label: label, fontSize: 14)
            if tag.frame.width + currentXPosition + horizontalStack.spacing < (width - 15 * 2) {
                horizontalStack.addArrangedSubview(tag)
                currentXPosition += tag.frame.width + horizontalStack.spacing
            } else {
                attach(horizontalStack, offset: lines * 28)
                
                lines += 1
                horizontalStack = createStackView()
                horizontalStack.addArrangedSubview(tag)
                currentXPosition = tag.frame.width
            }
        }
        
        attach(horizontalStack, offset: lines * 28)
        
        tagsContainerHeightConstraint.constant = (lines + 1) * 28
    }
    
    private func attach(_ stack: UIStackView, offset: CGFloat) {
        tagsContainer.addSubview(stack)
        stack.topAnchor.constraint(equalTo: tagsContainer.topAnchor, constant: offset).isActive = true
        stack.leadingAnchor.constraint(equalTo: tagsContainer.leadingAnchor, constant: 0).isActive = true
    }
    
    private func createStackView() -> UIStackView {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .fill
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 8
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStack
    }
}
