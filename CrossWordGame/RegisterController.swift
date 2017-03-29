//
//  RegisterController.swift
//  CrossWordGame
//
//  Created by Bartuğ Maden on 28/03/2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class RegisterController : ViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
        ref.child("users").child(user.uid).setValue(["username":txtUsername.text ])

    
    
}
