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
    var postTitle = ""
    var postContent = ""
    var currentUser = ""
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextField!
    
    @IBAction func doneButton(_ sender: Any) {
        if let text = titleField.text{
            postTitle = text
        }else{
            print("no text")
        }
        if let text = contentField.text{
            postContent = text
        }else{
            print("no text")
        }
        let post = Post(title: postTitle, content: postContent, addedByUser: currentUser)
        let postRef = self.dbRef.child(postTitle)
        
        postRef.setValue(post.toAnyObject())
        print(self.navigationController?.viewControllers)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference().child("post-items")
        let forumController = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! ForumViewController
        currentUser = forumController.currentUser
        
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