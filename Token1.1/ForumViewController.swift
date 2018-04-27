//
//  ForumViewController.swift
//  Token1.1
//
//  Created by Isabel on 2/24/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class ForumViewController: UITableViewController {
//    var dbRef: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
//        dbRef = Database.database().reference().child("post-items")
    }
    
    
//    @IBAction func addPost(_ sender: Any) {
//        let postAlert = UIAlertController(title: "New Post", message: "Enter your post", preferredStyle: .alert)
//        postAlert.addTextField{ (textField:UITextField) in
//            textField.placeholder = "Your post"
//        }
//        postAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: {(action:UIAlertAction) in
//           if let postContent = postAlert.textFields?.first?.text{
//                let post = Post(content: postContent, addedByUser: "User")
//
//                let postRef = self.dbRef.child(postContent.lowercased())
//
//                postRef.setValue(post.toAnyObject())
//            }
//        }))
//        self.present(postAlert, animated: true,completion: nil)
//    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    @objc func MoreTapped(){
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 100
        self.view.layer.shadowOffset = CGSize.zero
    }

}
