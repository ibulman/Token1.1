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
        self.date = date
    }
    
    func calendarDidPageToDate(date: Moment) {
        title = date.format("MMMM d, yyyy")
        self.date = date
    }
    
    func addLog(log: Log) {
        logs.append(log)
    }

    @IBOutlet weak var calendar: CalendarView!
    
    var logs = [Log]()
    var date = moment()
    
    override func viewDidLoad() {
        calendar.delegate = self
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "LogDay":
            segue.destination.navigationItem.title = self.date.format("MMMM d, yyyy")
            (segue.destination as! LogViewController).logDate = self.date
            
        default:
            print("unknown segue identifier")
        }
    }

    @objc func MoreTapped(){
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
