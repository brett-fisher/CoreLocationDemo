//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Brett Fisher on 10/26/17.
//  Copyright © 2017 Brett Fisher. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
  
  var manager: CLLocationManager?
  var startLocation: CLLocation?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    manager = CLLocationManager()
    manager?.delegate = self
    manager?.desiredAccuracy = kCLLocationAccuracyBest
    manager?.requestWhenInUseAuthorization()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension ViewController: CLLocationManagerDelegate {
  
  // Respond to any locations that come to the app
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if startLocation == nil {
      startLocation = locations.first
    } else {
      guard let latest = locations.first else { return }
      let distanceInMeters = startLocation?.distance(from: latest)
      print("distance in meters: \(distanceInMeters)")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse || status == .authorizedAlways {
      manager.startUpdatingLocation()
    }
  }
  
}

