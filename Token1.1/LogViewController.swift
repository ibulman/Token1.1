//
//  LogViewController.swift
//  Token1.1
//
//  Created by Karin Alsop on 5/27/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

enum tags: Int {
    case sober
    case usedAcceptably
    case used
}

class LogViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    var tags = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tags.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tags[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PickerView.delegate = self
        self.PickerView.dataSource = self
        
        self.tags = ["Sober", "Used", "Used Moderately"]
        
    }
}
