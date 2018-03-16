//
//  SideMenuVC.swift
//  Token1.1
//
//  Created by Isabel on 2/14/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        switch indexPath.row{
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name("ShowMainScreen"), object: nil)

        case 1:
            NotificationCenter.default.post(name: NSNotification.Name("ShowScreen1"), object: nil)

        case 2:
            NotificationCenter.default.post(name: NSNotification.Name("ShowScreen2"), object: nil)

        case 3:
            NotificationCenter.default.post(name: NSNotification.Name("ShowScreen3"), object: nil)
        default: break
        }
    }

}
