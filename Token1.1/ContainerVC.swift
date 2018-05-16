//
//  ViewController.swift
//  Token1.1
//
//  Created by Isabel on 2/14/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    var currentUser: String!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
    
    }
    
    @objc func toggleSideMenu(){
        if sideMenuOpen{
            sideMenuOpen = false
            sideMenuConstraint.constant = -240
        }else{
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "main"?:
            let navController = segue.destination as! UINavigationController
            let mainController = navController.viewControllers[0] as! MainVC
            mainController.currentUser = self.currentUser
            
        default:
            return
        }
    }



}

