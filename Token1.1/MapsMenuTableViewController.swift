//
//  MapsMenuTableViewController.swift
//  Token1.1
//
//  Created by Isabel on 5/15/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapsMenuTableViewController: UITableViewController {
    let baseURLString1 = "https://maps.googleapis.com/maps/api/place/details/json?placeid="
    let baseURLString2 = "&key=AIzaSyDfCxac0InThTBk_bTkLa8rbbfPQC-QhNU"
    
//    func getURL(placeKey: String) -> URL{
//        return URL(string: String(baseURLString1 + placeKey + baseURLString2))!
//    }
//    
////
////    func barcodes(fromJSON data: Data)->barcodeResult{
////
////        do{
////            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
////            guard
////                let jsonDictionary = jsonObject as? [String:Any]
////                else{
////
////                    return .failure(barcodeError.invalidJSONData)
////            }
////            print(jsonDictionary)
////            var finalPlace = Place(name: "", address: "", phoneNumber: "", lat: 0, long: 0, rating: 0, website: "")
////            if let place = MapsMenuTableViewController.place(fromJSON: jsonDictionary){
////                finalPlace = place
////            }
////            //            print(finalItem)
////
////            return .success(finalPlace)
////        }catch let error{
////            return .failure(error)
////        }
////
////    }
////    private static func place(fromJSON json: [String: Any]) -> Place?{
////        guard
////            let result = json["result"]
//////            let address = json["brand"] as? String,
//////            let phonelNumber = json["upcnumber"] as? String,
//////            let lat = json["category"] as? String,
//////            let long = json["msrp"] as? String
//////            let rating = json["msrp"] as? String
//////            let website = json["msrp"] as? String
////
////            //            let barcode = json["upcnumber"] as? Int
////            // let date = NSDate()
////
////            else{
////                return nil
////        }
////        //        print("doing fooditem")
////                print(result)
//////        return PantryItem(brand: brand, serialNumber: Int(serialNumber)!, description: desc, category: category, cost: Double(price)!)
////        return nil
////    }
////    private let session: URLSession = {
////        let config = URLSessionConfiguration.default
////        return URLSession(configuration: config)
////    }()
////
////    private func processBarcode(data: Data?, error: Error?)->barcodeResult{
////        guard let jsonData = data else{
////            //            return .failu
////            return .failure(error!)
////        }
////        print("PRINTING BARCODE")
////        //        print(jsonData)
////        //        print("working")
////        return
////            barcodes(fromJSON: jsonData)
////    }
////    func fetchItems(url: URL, completion: @escaping (barcodeResult) -> Void){
////
////        let request = URLRequest(url: url)
////        let task = session.dataTask(with: request){
////            (data, response, error)->Void in
////
////
////            let result = self.processBarcode(data: data, error: error)
////            //            print("PRINGITNI RESULT")
////            //            print(result)
////            completion(result)
////            switch result{
////            case let .success(item):
////                print("success")
//////                self.setItem(Item: item)
////            case let .failure(error):
////                print("fail")
////
////            }
////
////        }
////
////        task.resume()
////
////    }
////enum barcodeError: Error{
////    case invalidJSONData
////}
////enum placeResult{
////    case success(Place)
////    case failure(Error)
////}
////enum barcodeResult{
////    case success(Place)
////    case failure(Error)
////}
////
////
//    
//    enum placeResult{
//        case success(Place)
//        case failure(Error)
//    }
//    
//    private let session: URLSession = {
//        let config = URLSessionConfiguration.default
//        return URLSession(configuration: config)
//    }()
//    func fetchItems(url: URL, completion: @escaping (placeResult) -> Void){
//        
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request){
//            (data, response, error)->Void in
//            
//            
//            let result = self.getPlace(jsonData: data!, error: error)
//            //            print("PRINGITNI RESULT")
//            //            print(result)
//            completion(result)
//            switch result{
//            case let .success(place):
//                print("success")
////                self.setItem(Item: item)
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
//    
//    func getPlace(jsonData data : Data, error : Error?) -> placeResult{
////        URLSession.shared.dataTask(with: getURL(placeKey: "ChIJC3IXKl6d44kRz2mmYnalnx4")) {(data, response, err) in
////            print("stuff")
//        
////            guard let data = data else {return}
//        
//            do{
//                let place = try JSONDecoder().decode(Place.self, from: data)
//                
//                return .success(place)
//                
//                
//            } catch let jsonErr{
//                print("error")
//                return .failure(jsonErr)!
//            }
//            //            let dataAsString = String(data: data, encoding: .utf8)
////            }.resume()
////        print(finalplace)
////        return finalplace
//        
//    }
    
    
    
    
    var places : [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getPlace(placeID: "ChIJC3IXKl6d44kRz2mmYnalnx4")
//        fetchItems(url: getURL(placeKey: "ChIJC3IXKl6d44kRz2mmYnalnx4"), completion: {(placeResult)->Void in
//            switch placeResult{
//            case let .success(place):
//                print("success")
//                print(place)
//                self.places.append(place)
//                print("PLACES 1")
//                print(self.places)
//                //                            print(addController)
//                //                            self.currentItem = item
//                //                            self.pantry.allItems.append(item)
//
//            case let .failure(error):
//                print("fail")
//            }
//        })
//        fetchItems(url: getURL(placeKey: "ChIJC3IXKl6d44kRz2mmYnalnx4"), completion: {(barcodeResult)->Void in
//            switch barcodeResult{
//            case let .success(item):
//                print("success")
//                print(item)
//                //                            print(addController)
//                //                            self.currentItem = item
//                //                            self.pantry.allItems.append(item)
//
//            case let .failure(error):
//                print("fail")
//            }
//        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "customCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! Cell
        
        let place = places[indexPath.row]
//        cell.textLabel?.text = place.result.name
        cell.nameLabel.text = place.result.name
        cell.distanceLabel.text = String(describing: place.distance!.rounded())
        //        cell?.detailTextLabel?.text = "1111"
//        print(places)
        return cell
        
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
