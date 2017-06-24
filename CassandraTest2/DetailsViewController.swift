//
//  DetailsViewController.swift
//  CassandraTest2
//
//  Created by Raddaoui Mohamed Raid on 6/23/17.
//  Copyright © 2017 tn.esprit.Pokedex3. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var usr:User!

    @IBOutlet var email: UITextField!
    @IBOutlet var firstname: UITextField!
    @IBOutlet var lastname: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        email.text = usr.email
        firstname.text = usr.firstname
        lastname.text = usr.lastname

    }

    
}
