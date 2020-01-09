//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    checkAuthorizationStatus()
    mapView.showsUserLocation = true
    mapView.mapType = . satellite
    
  }
  
  
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse: fallthrough
    case .authorizedAlways:
        startUpdatingLocation()
    @unknown default: break
    
    }
    
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedWhenInUse || status == .authorizedAlways else { return }
    guard  CLLocationManager.locationServicesEnabled() else { return }
//    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//    locationManager.distanceFilter = 10.0
    locationManager.startUpdatingLocation()
    
  }
  
  @IBAction func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}
extension MyLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("Unathorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let current = locations.last!
        let coordinate = current.coordinate
       //캐시된 정보가 오래된 거면 무시하고 10초 이내것만 처리
        if (abs(current.timestamp.timeIntervalSinceNow) < 10){
        //숫자가 클수록 큰 범위를 다룸. span 단위는 1도 (경도는 1도 약111킬로미터)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        addAnnotation(location: current)
        }
    }
    // 내가 방문했던 위치 정보 저장
    func addAnnotation(location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.title = "My Location"
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("trueHeading: ", newHeading.trueHeading) //진북
        print("magneticHeading: ", newHeading.magneticHeading) //자북
        print("value \(newHeading.x), \(newHeading.y),\(newHeading.z)")
    }
}

