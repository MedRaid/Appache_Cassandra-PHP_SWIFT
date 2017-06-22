//
//  ViewController.swift
//  CassandraTest2
//
//  Created by Raddaoui Mohamed Raid on 6/17/17.
//  Copyright © 2017 tn.esprit.Pokedex3. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var userid: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var firstname: UITextField!
    @IBAction func sendData(_ sender: UIButton) {
       
        let URL_USER_LOGIN = "http://192.168.1.4:8888/phps/insert.php"
        //getting the username and password
        let parameters: Parameters=[
           // "userid":userid.text!,
          
            "email":email.text!,
            "firstname":firstname.text!

        ]

        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                print(response)
                
                
                
        }
        
        
        
        
        
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

