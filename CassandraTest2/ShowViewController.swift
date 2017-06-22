//
//  ShowViewController.swift
//  CassandraTest2
//
//  Created by Raddaoui Mohamed Raid on 6/20/17.
//  Copyright © 2017 tn.esprit.Pokedex3. All rights reserved.
//

import UIKit
import Alamofire


class ShowViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    
    var items : [User] = [User] ()
    var i:Int = 0
    @IBOutlet var tableview: UITableView!

    
    

    func downloadUserDetails(completed: @escaping DownloadComplete){
        
//        struct User
//        {
//            var email:String
//            var firstname:String
//            var lastname:String
//            
//            init(dict:Dictionary<String,AnyObject>) {
//                email = dict["email"] as! String
//                firstname = dict["firstname"] as! String
//                lastname = dict["lastname"] as! String
//                
//            }
//        }
        
        let Ful_Url = "http://192.168.1.4:8888/phps/select.php"
        
        Alamofire.request(Ful_Url).responseJSON(completionHandler:  { (response) in
            
            if let userDect = response.result.value as? [Dictionary<String,AnyObject>]{
                
                for ex in 0...userDect.count-1
                {
                    let users:User? = User()

                    if let userid = userDect[ex]["userid"] as? Dictionary<String,AnyObject>{
                        if let uuid = userid["uuid"] as? String{
                            print("UUUUUUSSSSSERRR IDDDD")
                            print(uuid)
                            users?.uuid = uuid

                        }
                    }
                    
                    
                    
                    if let firstnames = userDect[ex]["firstname"] as? String{
                    users?.firstname = firstnames

                    
                    }
                    
                    if let emails = userDect[ex]["email"] as? String{
                        users?.email = emails

                    }
                    
                    if let lastnames = userDect[ex]["lastname"] as? String{
                       users?.lastname = lastnames

                    }

                     print("---------------------------------")

                    self.items.append(users!)
                    
                    
                    
                }
            }
//
//            if let usersDict = response.result.value as? [Dictionary<String,AnyObject>] {
//                self.users = usersDict.map({ dict in
//                    let user = User()
//                    if let firstnames = dict["firstname"] as? String{
//                        user.firstname = firstnames }
//                    
//                    if let emails = dict["email"] as? String{
//                        user.email = emails }
//                    
//                    if let lastnames = dict["lastname"] as? String{
//                        user.lastname = lastnames }
//                    
//                    return user
//                })
//                
//                self.tableview.reloadData()
//            }
            
            
            
            
            for item in self.items {
                print("REEEEEEEDUNDANT")
                print(item.firstname) }
            completed()
         self.tableview.reloadData()
        })

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.items = [User]()
//        
//        downloadUserDetails{}
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // self.items = [User]()

        downloadUserDetails{}
        //self.tableview.reloadData()

    }
//
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("####################")
//        print("nombre items")
//        print(self.items.count)
        return items.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier:"myCell" , for:indexPath)
        
        let email:UILabel = cell.viewWithTag(11) as! UILabel
        let firstname:UILabel = cell.viewWithTag(12) as! UILabel
        let lastname:UILabel = cell.viewWithTag(13) as! UILabel
        let uuid:UILabel = cell.viewWithTag(22) as! UILabel

            print("=========================email=========================")
            print(items[indexPath.row].email)
            email.text = items[indexPath.row].email
            firstname.text = items[indexPath.row].firstname
            lastname.text = items[indexPath.row].lastname
        uuid.text = items[indexPath.row].uuid


        return cell

    }
    

    
    
    
    
    
    
    
    
    
}
