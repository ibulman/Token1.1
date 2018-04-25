//
//  LoginViewController.swift
//  Token1.1
//
//  Created by Isabel on 4/23/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login(){
        let email = emailField.text
        let pass = passField.text
        
        Auth().signIn(withEmail: email!, password: pass!, completion: {(user:User?, error: Error?) in
            if error != nil{
                print(error?.description)
            }
        })
    }
    @IBAction func signUp(){
        let email = emailField.text
        let pass = passField.text
        
        Auth().createUser(withEmail: email!, password: pass!, completion: {(user:User?, error: Error?) in
            if error != nil{
                print(error?.description)
            }
        })
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
