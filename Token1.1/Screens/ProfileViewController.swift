//
//  InfoViewController.swift
//  Token1.1
//
//  Created by Isabel on 2/24/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    var currentUser : String!
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text = currentUser
navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(displayP3Red: 1, green: 227/255, blue: 105/255, alpha: 1)
        // Do any additional setup after loading the view.
    }

    @objc func MoreTapped(){
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 100
        self.view.layer.shadowOffset = CGSize.zero
    }
    

}
