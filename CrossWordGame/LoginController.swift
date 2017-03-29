//
//  LoginController.swift
//  CrossWordGame
//
//  Created by Bartuğ Maden on 28/03/2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginController : ViewController{
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
    
    

    @IBAction func btnRegister(_ sender: UIButton) {

            guard let email = txtEmail.text, let password = txtPassword.text , let username = txtUsername.text
                
                else {
                    print("Form is not valid")
                    return
            }
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user:FIRUser?,error) in
                
                
                
                if error != nil{
                    print(error)
                    return
                    
                }
                
                
                
                
                let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
                let values = ["Username":username,"Email":email]
                ref.updateChildValues(values,withCompletionBlock:{(err, ref) in
                    
                    if err != nil{
                        print(err)
                        return
                    }
                    })
                
            
            })
        
        
        
        txtUsername.text = ""
        txtEmail.text = ""
        txtPassword.text = ""
        txtConfirmPassword.text = ""
        
        
    
        }
}

    
