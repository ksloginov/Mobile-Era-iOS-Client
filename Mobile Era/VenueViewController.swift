//
//  VenueViewController.swift
//  Mobile Era
//
//  Created by Konstantin Loginov on 22/04/2018.
//  Copyright © 2018 FotMob. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class VenueViewController: BaseViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mapContainer: UIView!
    
    private let latitude = 59.9101662
    private let longitude = 10.7228843
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizable.venue()
        
        scrollView.contentInset = UIEdgeInsetsMake(15, 0, 15, 0)
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapContainer.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.widthAnchor.constraint(equalTo: mapContainer.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: mapContainer.heightAnchor).isActive = true
        mapView.centerXAnchor.constraint(equalTo: mapContainer.centerXAnchor).isActive = true
        mapView.centerYAnchor.constraint(equalTo: mapContainer.centerYAnchor).isActive = true
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "Felix konferansesenter"
        marker.snippet = "Oslo"
        marker.map = mapView
    }
}
