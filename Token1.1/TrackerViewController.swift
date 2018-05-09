//
//  TrackerViewController.swift
//  Token1.1
//
//  Created by Isabel on 2/24/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import SwiftMoment

class TrackerViewController: UIViewController, CalendarViewDelegate {
    
    func calendarDidSelectDate(date: Moment) {
        title = date.format("MMMM d, yyyy")
    }
    
    func calendarDidPageToDate(date: Moment) {
        title = date.format("MMMM d, yyyy")
    }
    
    @IBOutlet weak var calendar: CalendarView!

    override func viewDidLoad() {
        calendar.delegate = self
        super.viewDidLoad()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(MoreTapped))
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
