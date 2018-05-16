//
//  addPostViewController.swift
//  Token1.1
//
//  Created by Isabel on 3/18/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class addPostViewController: UIViewController {
   var dbRef: DatabaseReference!
    var postContent = ""
    var currentUser = ""
    @IBOutlet weak var contentField: UITextField!
    
    @IBAction func doneButton(_ sender: Any) {
        if let text = contentField.text{
            postContent = text
        }else{
            print("no text")
        }
        let post = Post(content: postContent, addedByUser: "Username")
        let postRef = self.dbRef.child(postContent.lowercased())
        
        postRef.setValue(post.toAnyObject())
        print(self.navigationController?.viewControllers)
        
//        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference().child("post-items")
        
//            dbRef = (self.navigationController?.viewControllers[1] as! ForumViewController).dbRef
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
