//
//  User.swift
//  CassandraTest2
//
//  Created by Raddaoui Mohamed Raid on 6/20/17.
//  Copyright © 2017 tn.esprit.Pokedex3. All rights reserved.
//

import Foundation
import Alamofire

class User {
    static let sharedInstance = User()

    private var _uuid:String! = ""

    private var _firstname:String! = ""
    private var _lastname:String! = ""
    private var _email:String! = ""

    
    var uuid:String {
        get {
            if _uuid == nil {
                _uuid = ""
            }
            
            return _uuid        }
        set {
            
            _uuid = newValue
        }
    }
    
    var firstname:String {
        get {
            if _firstname == nil {
                _firstname = ""
            }
            
            return _firstname        }
        set {
           
            _firstname = newValue
        }
    }
    
    
    
 
//    var firstname:String{
//        if _firstname == nil {
//            _firstname = ""
//        }
//        
//        return _firstname
//        
//    }
    
    var lastname:String{
        get{  if _lastname == nil {
            _lastname = ""
        }
        
        return _lastname
        }
        
        set {
            
            _lastname = newValue
        }
    }
 
    var email:String{
        get{  if _email == nil {
            _email = ""
        }
        
            return _email}
        

        set {
            
            _email = newValue
        }
    }
    
    init(){
        
    }
    
    
//    init(dict:Dictionary<String,AnyObject>) {
//        email = dict["email"] as! String
//        firstname = dict["firstname"] as! String
//        lastname = dict["lastname"] as! String
//        
//    }
    
    
    init (uuid:String,email:String,firstname:String,lastname:String){
        self._uuid = uuid

        self._email = email
        self._firstname = firstname
         self._lastname = lastname
        
}
    func toAnyObject() -> Any {
        
        return [
              "uuid": ""+uuid,
            "firstname": ""+firstname,
            "lastname": ""+lastname,
            
            "email": ""+email
            
            
            
        ]
    }
    
    

}
