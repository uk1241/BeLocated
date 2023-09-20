//
//  mapViewController.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 05/09/23.
//

import UIKit
import GoogleMaps
import CoreLocation

class mapViewController: UIViewController,CLLocationManagerDelegate, GMSMapViewDelegate{
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationMainTitle: UILabel!
    @IBOutlet weak var locationSubTitle: UILabel!
    @IBOutlet weak var marker: UIImageView!
    private var locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        mapView.layer.cornerRadius = 24
        mapView.clipsToBounds = true
        mapView.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        // Set up map view delegate
        mapView.delegate = self
        
        // Request location authorization
        locationManager.requestWhenInUseAuthorization()

        // Add the mapView to your view
        view.addSubview(mapView)
        mapView.mapType = .hybrid

        // Disable "My Location" (blue dot) as it may interfere with user interactions
        mapView.isMyLocationEnabled = false

        // Enable user interactions for zooming and panning
        mapView.settings.setAllGesturesEnabled(true)
        if let userLocation = locationManager.location?.coordinate {
            let camera = GMSCameraPosition.camera(withLatitude: userLocation.latitude, longitude: userLocation.longitude, zoom: 15.0)
            mapView.animate(to: camera)
        }
        
        // Start updating location
        locationManager.startUpdatingLocation()
        
        mapView.addSubview(self.marker)
        mapView.bringSubviewToFront(self.marker)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Start updating location
        locationManager.startUpdatingLocation()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("Latitude: \(latitude), Longitude: \(longitude)")
            // No need to add a marker or update the map's camera here
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            let latitude = location.coordinate.latitude
//            let longitude = location.coordinate.longitude
//            print("Latitude: \(latitude), Longitude: \(longitude)")
//
//            // Perform reverse geocoding
//            let locationToGeocode = CLLocation(latitude: latitude, longitude: longitude)
//            geocoder.reverseGeocodeLocation(locationToGeocode, completionHandler: { (placemarks, error) in
//                if let error = error {
//                    print("Reverse geocoding error: \(error.localizedDescription)")
//                    return
//                }
//
//                if let placemark = placemarks?.first {
//                    // Extract address details from the placemark
//                    let name = placemark.name ?? ""
//                    let street = placemark.thoroughfare ?? ""
//                    let city = placemark.locality ?? ""
//                    let state = placemark.administrativeArea ?? ""
//                    let postalCode = placemark.postalCode ?? ""
//                    let country = placemark.country ?? ""
//
//                    print("Name: \(name)")
//                    print("Street: \(street)")
//                    print("City: \(city)")
//                    print("State: \(state)")
//                    print("Postal Code: \(postalCode)")
//                    print("Country: \(country)")
//
//                    // Update your UI elements with the address details
//                    DispatchQueue.main.async {
//                        self.locationMainTitle.text = name
//                        self.locationSubTitle.text = "\(street), \(city), \(state), \(postalCode), \(country)"
//                    }
//                }
//            })
//        }
//    }


    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }

    // MARK: - GMSMapViewDelegate

//    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
//        let targetLocation = position.target // The coordinates of the point you moved the map to
//        print("Target Latitude: \(targetLocation.latitude), Target Longitude: \(targetLocation.longitude)")
//        locationMainTitle.text = String(targetLocation.latitude)
//        locationSubTitle.text = String(targetLocation.longitude)
//    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let targetLocation = position.target // The coordinates of the point you moved the map to
        print("Target Latitude: \(targetLocation.latitude), Target Longitude: \(targetLocation.longitude)")

        // Create a CLLocation instance with the target coordinates
        let locationToGeocode = CLLocation(latitude: targetLocation.latitude, longitude: targetLocation.longitude)

        // Perform reverse geocoding
        geocoder.reverseGeocodeLocation(locationToGeocode) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                // Extract address details from the placemark
                let name = placemark.name ?? ""
                let street = placemark.thoroughfare ?? ""
                let city = placemark.locality ?? ""
                let state = placemark.administrativeArea ?? ""
                let postalCode = placemark.postalCode ?? ""
                let country = placemark.country ?? ""

                print("Name: \(name)")
                print("Street: \(street)")
                print("City: \(city)")
                print("State: \(state)")
                print("Postal Code: \(postalCode)")
                print("Country: \(country)")

                // Update your UI elements with the address details
                DispatchQueue.main.async {
                    var subtitleComponents = [String]()

//                    if !name.isEmpty {
//                        subtitleComponents.append(name)
//                    }

                    if !street.isEmpty {
                        subtitleComponents.append(street)
                    }

                    if !city.isEmpty {
                        subtitleComponents.append(city)
                    }

                    if !state.isEmpty {
                        subtitleComponents.append(state)
                    }

                    if !postalCode.isEmpty {
                        subtitleComponents.append(postalCode)
                    }

//                    if !country.isEmpty {
//                        subtitleComponents.append(country)
//                    }

                    let subtitle = subtitleComponents.joined(separator: ", ")
                    self.locationSubTitle.text = subtitle

                    // Set the main title if it's not empty
                    if !name.isEmpty {
                        self.locationMainTitle.text = name
                    } else {
                        // You can set a default value or hide the main title label here if name is empty.
                    }
                }
            }
        }
    }
}
