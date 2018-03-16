//
//  MainVC.swift
//  Token1.1
//
//  Created by Isabel on 2/24/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen1), name: NSNotification.Name("ShowScreen1"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen2), name: NSNotification.Name("ShowScreen2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen3), name: NSNotification.Name("ShowScreen3"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showMainScreen), name: NSNotification.Name("ShowMainScreen"), object: nil)
        
    }
    @objc func showScreen1(){
        performSegue(withIdentifier: "ShowScreen1", sender: nil)
    }
    @objc func showScreen2(){
        performSegue(withIdentifier: "ShowScreen2", sender: nil)
    }
    @objc func showScreen3(){
        performSegue(withIdentifier: "ShowScreen3", sender: nil)
    }
    @objc func showMainScreen(){
        var numberOfControllers = self.navigationController?.viewControllers.count
        while numberOfControllers! > 1{
            self.navigationController?.viewControllers.popLast()
            
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
    

}
