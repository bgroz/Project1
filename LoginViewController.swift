//
//  LoginViewController.swift
//  CrossWordGame
//
//  Created by Buğra on 30.03.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var ref:FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    var userData = [String]()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SendButtonItem(_ sender: Any) {
        // Login Butonuna Basıldıktan sonra MainViewController'a geçiş
//        checkUserIfLogIn()
//        
//        if txtUsername.text != "" && txtPassword.text != "" {
//            
        
            let navigationVc = storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController")
            self.present(navigationVc!, animated: true, completion: nil)
//
//        } else {
//            let alert = UIAlertController(title: "Message", message: "Please fill the blanks", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert,animated: true, completion: nil)
//        }
//        
     
        
        
    }
    
  
 
    @IBAction func btnForgetPassword(_ sender: UIButton) {
        //Forget Butonuna Basıldıktan Sonra "Firebase"den mail gelmesi ve şifrenin güncellenmesi
        
  
        let alertController = UIAlertController(title: "Write Email", message: "Please enter your email adress", preferredStyle: UIAlertControllerStyle.alert)
        let findAction = UIAlertAction(title: "Send", style: UIAlertActionStyle.default){( action: UIAlertAction) in
            let emailTextField = alertController.textFields![0] as UITextField
            FIRAuth.auth()?.sendPasswordReset(withEmail: emailTextField.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil	 {
                    
                    title = "Opps"
                    message = (error?.localizedDescription)!
                }
                else
                {
                    title = "Success"
                    message = "Password reset email sent"
                }
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK!", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true , completion: nil)
                
            })

            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        alertController.addTextField { (textfield: UITextField) in
            textfield.placeholder = "email"
            

            
        }
        alertController.addAction(findAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated : true, completion: nil)
        
        
            }
    
    
    func checkUserIfLogIn()
    {
    ref = FIRDatabase.database().reference()
        ref?.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild("Username") && snapshot.hasChild("Password"){
            print("OK")
        }else{
            print("NO")
        }
        })
    }
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

