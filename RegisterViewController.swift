//
//  RegisterViewController.swift
//  CrossWordGame
//
//  Created by Buğra on 30.03.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        // Register butonuna basıldıktan sonra uygulamaya kayıt olunması ve DB'de kaydın tutulması
        
        if txtUsername.text == "" || txtEmail.text == "" || txtPassword.text == "" || txtConfirmPassword.text == ""  {
            let alert = UIAlertController(title: "Message", message: "Please fill the blanks", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert,animated: true, completion: nil)
        } else
        {
            let alert = UIAlertController(title: "Message", message: "Registiration is success", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            let navigationVc = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController")
            self.present(navigationVc!, animated: true, completion: nil)

        }
        
                guard let email = txtEmail.text, let password = txtPassword.text , let username = txtUsername.text
            
            else {
                print("Form is not valid")
                return
        }
        FIRAuth.auth()?.createUser(withEmail : email, password: password, completion: {(user:FIRUser?,error) in
            if error != nil{
                print(error)
                return
                
            }
            
            let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
            let values = ["Username":username,"Password":password]
            ref.child("Users").childByAutoId().setValue(values)
            
            
            
        })
        txtUsername.text = ""
        txtEmail.text = ""
        txtPassword.text = ""
        txtConfirmPassword.text = ""
 
    }
    
    

    
}
