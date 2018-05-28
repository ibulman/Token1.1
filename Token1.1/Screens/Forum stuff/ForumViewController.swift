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
    var dbRef: DatabaseReference!
    var posts = [Post]()
    var currentUser = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50"), style: .done, target: self, action: #selector(MoreTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 255, green: 227, blue: 105, alpha: 1)
       dbRef = Database.database().reference().child("post-items")
        startObservingDB()
        self.tableView.separatorColor = UIColor.clear

    }
    
    
    
    func startObservingDB(){
            print("observing")
        
        
        dbRef.observe(.value, with:{(snapshot: DataSnapshot) in
            var newItems = [Post]()
            for post in snapshot.children{
                let postObject = Post(snapshot: post as! DataSnapshot)
                newItems.append(postObject)
            }
            self.posts = newItems
            self.tableView.reloadData()
        }) {(error: Error) in
            print(error.localizedDescription)
        }
       dbRef.child("post-items").observe(.childChanged, with: { (snapshot) in
        var newItems = [Post]()
                    for post in snapshot.children{
                        let postObject = Post(snapshot: post as! DataSnapshot)
                        newItems.append(postObject)
                    }
                    self.posts = newItems
                    self.tableView.reloadData()
        })
    }
    
//    @IBAction func addPost(_ sender: Any) {
//        let postAlert = UIAlertController(title: "New Post", message: "Enter your post", preferredStyle: .alert)
//        postAlert.addTextField{ (textField:UITextField) in
//            textField.placeholder = "Your post"
//        }
//        postAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: {(action:UIAlertAction) in
//           if let postContent = postAlert.textFields?.first?.text{
//            let post = Post(content: postContent, addedByUser: self.currentUser)
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
        return posts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let post = posts[indexPath.row]
        if (indexPath.row == self.posts.count-1) {
            cell.separatorInset = UIEdgeInsetsMake(0, cell.bounds.size.width, 0, 0);
        }
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.addedByUser
        // Configure the cell...
        
        return cell
    }
    @objc func MoreTapped(){
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 100
        self.view.layer.shadowOffset = CGSize.zero
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "detail"?:
            if let row = tableView.indexPathForSelectedRow?.row{
                
                let post = posts[row]
                let postViewController
                    = segue.destination as! PostViewController
                postViewController.post = post
                postViewController.currentUser = self.currentUser
            }
        case "add"?:
            print("")
        default: 
        print("fail")
        }
    }

}
