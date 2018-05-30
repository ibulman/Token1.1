//
//  MapsViewController.swift
//  Token1.1
//
//  Created by Isabel on 5/2/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class MapsViewController: UIViewController , CLLocationManagerDelegate {
//    @IBOutlet weak var map : UIView!
    var table : MapsMenuTableViewController!
    var locationManager = CLLocationManager()
    var camera = GMSCameraPosition()
    var mapView = GMSMapView()
    var currentLocation : CLLocation!
    override func viewDidLoad() {
navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
      
        navigationItem.leftBarButtonItem?.tintColor = UIColor(displayP3Red: 1, green: 227/255, blue: 105/255, alpha: 1)
       super.viewDidLoad()
        view = mapView
        self.locationManager.delegate = self
        self.locationManager = CLLocationManager()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
showCurrentLocationOnMap()
        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//         Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.showCurrentLocationOnMap()
        self.locationManager.stopUpdatingLocation()
    }
    
    
    func showCurrentLocationOnMap(){
//        camera = GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 14)
//        print(self.locationManager.location)
//        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), camera: camera)
        currentLocation = self.locationManager.location
        mapView.animate(to: GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 14))
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        let marker = GMSMarker()
        marker.position = camera.target
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.map = mapView
//        self.view.addSubview(mapView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("display map")
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func MoreTapped(){
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 100
        self.view.layer.shadowOffset = CGSize.zero
    }


}
