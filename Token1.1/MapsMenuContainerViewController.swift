//
//  MapsMenuContainerViewController.swift
//  Token1.1
//
//  Created by Isabel on 5/15/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class MapsMenuContainerViewController: UIViewController {
    @IBOutlet weak var bottomMenuConstraint : NSLayoutConstraint!
    var menuOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
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
            bottomMenuConstraint.constant = -180
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

}
