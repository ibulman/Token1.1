//
//  PostViewController.swift
//  Token1.1
//
//  Created by Isabel on 5/23/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PostViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var currentUser : String = ""
    var dbRef: DatabaseReference!
    var replies : [Reply]!
    @IBOutlet weak var table: UITableView!
    @IBAction func reply(_ sender: Any) {
        let postAlert = UIAlertController(title: "New Post", message: "Enter your post", preferredStyle: .alert)
                postAlert.addTextField{ (textField:UITextField) in
                    textField.placeholder = "Your post"
                }
                postAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: {(action:UIAlertAction) in
                   if let replyContent = postAlert.textFields?.first?.text{
                    let reply = Reply(content: replyContent, addedByUser: self.currentUser)
                    let replyRef = self.dbRef.child("\(self.post.title!)").child("replies").child(replyContent.lowercased())
//                    self.post.replies.append(reply)
//                    self.dbRef.child("\(self.post.title)!").child("replies").setValue(["reply"])
//                        let postRef = self.dbRef.child(replyContent.lowercased())
//
                    replyRef.setValue(reply.toAnyObject())
                    }
                }))
                self.present(postAlert, animated: true,completion: nil)
    }
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    var post : Post!
    override func viewDidLoad() {
        dbRef = Database.database().reference().child("post-items")
        super.viewDidLoad()
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 140
        
postTitle.text = post.title
        author.text = post.addedByUser
        content.text = post.content
        replies = post.replies
        startObservingDB()
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
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return replies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! postviewCell
        let reply = replies[indexPath.row]
        cell.replyContent.text = reply.content
//        cell.detailTextLabel?.text = reply.addedByUser
        // Configure the cell...
        
        return cell
    }
    func startObservingDB(){
        print("observing")
        
        
        dbRef.child("\(post.title!)").child("replies").observe(.value, with:{(snapshot: DataSnapshot) in
            var newItems = [Reply]()
            for reply in snapshot.children{
                let replyObject = Reply(snapshot: reply as! DataSnapshot)
                newItems.append(replyObject)
            }
            self.replies = newItems
            self.table.reloadData()
        }) {(error: Error) in
            print(error.localizedDescription)
        }
//        dbRef.child("post-items").child("\(post.title!)").child("replies").observe(.childChanged, with: { (snapshot) in
//            var newItems = [Reply]()
//            for reply in snapshot.children{
//                let replyObject = Reply(snapshot: reply as! DataSnapshot)
//                newItems.append(replyObject)
//            }
//            self.replies = newItems
//            self.table.reloadData()
//        })
    }
}
