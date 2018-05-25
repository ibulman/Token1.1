//
//  MapsMenuContainerViewController.swift
//  Token1.1
//
//  Created by Isabel on 5/15/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class MapsMenuContainerViewController: UIViewController {
    var table : MapsMenuTableViewController!
    var map : MapsViewController!
    @IBOutlet weak var bottomMenuConstraint : NSLayoutConstraint!
    var menuOpen = false
    var currentLocation : CLLocation!
    override func viewDidLoad() {
        currentLocation = map.currentLocation
        
        super.viewDidLoad()
        
navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
        fetchItems(url: getURL(placeKey: "ChIJC3IXKl6d44kRz2mmYnalnx4"), completion: {(placeResult)->Void in
            switch placeResult{
            case let .success(place):
                print("success")
//                print(table)
                
//                self.table.places.append(place)
                
                //                            print(addController)
                //                            self.currentItem = item
                //                            self.pantry.allItems.append(item)
                
            case let .failure(error):
                print("fail")
            }
        })
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "map":
            map = segue.destination as! MapsViewController
        case "table":
            table = segue.destination as! MapsMenuTableViewController
        default:
            print("Error")
        }
    }
    @objc func MoreTapped(){
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 100
        self.view.layer.shadowOffset = CGSize.zero
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        toggleMenu()
    }
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        toggleMenu()
    }
    func toggleMenu(){
        if menuOpen{
            bottomMenuConstraint.constant = -206
            menuOpen = false
        }else{
            bottomMenuConstraint.constant = 0
            menuOpen = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    let baseURLString1 = "https://maps.googleapis.com/maps/api/place/details/json?placeid="
    let baseURLString2 = "&key=AIzaSyDRtDvsF6085COmebvWS33JqpL4Pgzu3jo"
//    let baseURLString3 = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=:"
//    let baseURLString4 = "&destinations="
//
    func getURL(placeKey: String) -> URL{
        return URL(string: String(baseURLString1 + placeKey + baseURLString2))!
    }
//    func getURL2(placeKey: String, placeKey2 : String) -> URL{
//        return URL(string: String(baseURLString3 + placeKey + baseURLString4 + placeKey2 + baseURLString2))!
//    }

   
    enum placeResult{
        case success(Place)
        case failure(Error)
    }
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    func fetchItems(url: URL, completion: @escaping (placeResult) -> Void){
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error)->Void in
            
            
            let result = self.getPlace(jsonData: data!, error: error)
            //            print("PRINGITNI RESULT")
                        print(result)
            completion(result)
            switch result{
            case let .success(place):
                print("success")
                
                self.table.places.append(place)
            //                self.setItem(Item: item)
            case let .failure(error):
                print("fail")
                
            }
            
        }
        
        task.resume()
        
    }
    
    func getPlace(jsonData data : Data, error : Error?) -> placeResult{
    
        do{
            var place = try JSONDecoder().decode(Place.self, from: data)
            let placeCoor = CLLocation(latitude: place.result.geometry.location.lat, longitude: place.result.geometry.location.lng)
            place.distance = placeCoor.distance(from: currentLocation) / 1609.344
//            self.fetchDis(url: URL(string: "
//                )!, completion: {(disResult)->Void in
//                switch disResult{
//                case let .success(dis):
//                    print("success")
//                    print(dis)
////                    place.distance = dis
//                    //                print(table)
//
//                    //                self.table.places.append(place)
//
//                    //                            print(addController)
//                    //                            self.currentItem = item
//                    //                            self.pantry.allItems.append(item)
//
//                case let .failure(error):
//                    print("fail")
//                }
//            })
            print(place)
            return .success(place)
            
            
        } catch let jsonErr{
            print("error")
            return .failure(jsonErr)!
        }
 
        
    }
//    enum disResult{
//        case success(distanceData)
//        case failure(Error)
//    }
//    func fetchDis(url: URL, completion: @escaping (disResult) -> Void){
//
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request){
//            (data, response, error)->Void in
//
//            print(data)
//            let result = self.getMiles(jsonData: data!, error: error)
//                        print("PRINGITNI RESULT")
//            print(error)
//                        print(result)
//            completion(result)
//            switch result{
//            case let .success(dis):
//                print(" dis success")
//
//            //                self.setItem(Item: item)
//            case let .failure(error):
//                print("fail")
//
//            }
//
//        }
//
//        task.resume()
//
//    }
//    func getMiles(jsonData data : Data, error : Error?) -> disResult{
//        do{
//            let distance = try JSONDecoder().decode(distanceData.self, from: data)
//
//            return .success(distance)
//
//
//        } catch let jsonErr{
//            print("error")
//            return .failure(jsonErr)!
//        }
//
//    }
}
