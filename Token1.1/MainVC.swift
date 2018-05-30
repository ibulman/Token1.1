//
//  MainVC.swift
//  Token1.1
//
//  Created by Isabel on 2/24/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class MainVC: UIViewController {
    var currentUser : String!
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        var ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("Users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["UserID"] as? String ?? ""
            self.userLabel.text = username
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen1), name: NSNotification.Name("ShowScreen1"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen2), name: NSNotification.Name("ShowScreen2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen3), name: NSNotification.Name("ShowScreen3"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen4), name: NSNotification.Name("ShowScreen4"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showMainScreen), name: NSNotification.Name("ShowMainScreen"), object: nil)
        
    }
    @objc func showScreen1(){
        performSegue(withIdentifier: "ShowScreen1", sender: nil)
        print(self.navigationController?.viewControllers)
    }
    @objc func showScreen2(){
        performSegue(withIdentifier: "ShowScreen2", sender: nil)
        print(self.navigationController?.viewControllers)

    }
    @objc func showScreen3(){
        performSegue(withIdentifier: "ShowScreen3", sender: nil)
        print(self.navigationController?.viewControllers)
        

    }
    @objc func showScreen4(){
        performSegue(withIdentifier: "ShowScreen4", sender: nil)
        print(self.navigationController?.viewControllers)
        
        
    }
    @objc func showMainScreen(){
        var numberOfControllers = self.navigationController?.viewControllers.count
        while numberOfControllers! > 1{
            self.navigationController?.viewControllers.popLast()
            numberOfControllers = self.navigationController?.viewControllers.count
            print(self.navigationController?.viewControllers)

            
        }

    }
    @IBAction func onMoreTapped(){
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 100
        self.view.layer.shadowOffset = CGSize.zero
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "ShowScreen2"?:
            let forumController = segue.destination as! ForumViewController
            forumController.currentUser = self.currentUser
        case "ShowScreen3"?:
            let profController = segue.destination as! ProfileViewController
            profController.currentUser = self.currentUser
        default:
            return
        }
    }
    

}
