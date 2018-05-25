//
//  SignUpViewController.swift
//  Token1.1
//
//  Created by Isabel on 4/25/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var UserID: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    var userStorage : StorageReference!
 var dbRef: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UserID.delegate = self
        self.nameField.delegate = self
        self.confirmPass.delegate = self
        self.emailField.delegate = self
        self.passField.delegate = self
         dbRef = Database.database().reference().child("Users")
        let storage = Storage.storage().reference(forURL: "gs://token-d75ba.appspot.com")
        userStorage = storage.child("users")
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUp(){
        //        let email = emailField.text
        //        let pass = passField.text
        //
        //        Auth().createUser(withEmail: email!, password: pass!, completion: {((Optional(User), Error?)?) in
        //            if error != nil{
        //                print(error?.description)
        //            }
        //        })
        
        let email = emailField.text
        let pass = passField.text
        if email == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email!, password: pass!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    if self.passField.text == self.confirmPass.text{
                    if let user = user{
                        let userInfo = ["Full Name" : self.nameField.text! , "Email" : self.emailField.text!, "UserID" : self.UserID.text!]
                        self.dbRef.child("\(user.uid)").setValue(userInfo)
                    }
                    }
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
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
