//
//  LocationService.swift
//  DikidiNour
//
//  Created by Vovchela10 on 06.06.2024.
//

import CoreLocation
import Foundation

protocol LocationServiceProtocol: AnyObject {
    var onLocationDetermined: ((String) -> Void)? { get set }
    
    func requestLocation()
}

final class LocationService: NSObject, LocationServiceProtocol {
    private let locationManager = CLLocationManager()
    
    var onLocationDetermined: ((String) -> Void)?
    var onLocationError: ((Error) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            determineLocation(from: location)
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Ошибка получения местоположения: \(error)")
        onLocationError?(error)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            locationManager.requestLocation()
        } else {
            print("Местоположение не авторизовано")
        }
    }

    private func determineLocation(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            if let placemark = placemarks?.first,
               let city = placemark.locality,
               let region = placemark.administrativeArea {
                let combinedLocation = "\(city), \(region)"
                self?.onLocationDetermined?(combinedLocation)
                print(combinedLocation)
            } else if let error = error {
                print("Ошибка обратного геокодирования: \(error)")
                self?.onLocationError?(error)
            }
        }
    }
}
