//
//  ViewController.swift
//  CrossWordGame
//
//  Created by Bartuğ Maden on 20/03/2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Fabric
import TwitterKit
import FBSDKLoginKit



class ViewController: UIViewController , FBSDKLoginButtonDelegate{
    
    @IBOutlet weak var btnTwitter: TWTRLogInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFacebookButtons()
        setupTwitterButtons()
        self.showEmailAdress()
        listingWords()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func setupTwitterButtons(){
        
        

        
        let twitterButton = TWTRLogInButton { (session, error) in
            if let err = error {
                print("Failed",err)
                return
                
            }
            
            guard let token = session?.authToken else {return}
            guard let secret = session?.authTokenSecret else {return }
            let credentials = FIRTwitterAuthProvider.credential(withToken: token, secret: secret)
            FIRAuth.auth()?.signIn(with: credentials, completion: { (user , error) in
                if let err = error{
                    print("failed",err)
                    return
                }
            })
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as UIViewController
            
            self.present(viewController, animated: false, completion: nil)
        }
        
        view.addSubview(twitterButton)
        twitterButton.frame = CGRect(x: 20, y: 400 + 66, width: view.frame.width - 32, height: 50)
        
    
    }
        fileprivate func setupFacebookButtons(){
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 20, y: 400, width: view.frame.width - 32, height: 50)
        
        
        loginButton.delegate = self
        loginButton.readPermissions = ["email","public_profile"]
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out  of facebook")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        showEmailAdress()
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
        
    }
    func showEmailAdress(){
        
        
        let accessToken = FBSDKAccessToken.current()
        guard (accessToken?.tokenString) != nil else{return}
        let credentials  = FIRFacebookAuthProvider.credential(withAccessToken: (accessToken?.tokenString)!)
        FIRAuth.auth()?.signIn(with: credentials, completion: {(user,error) in
            if error != nil
            {
                print("Failed",error ?? "")
            }
            
            print ("Success")
        })
        
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email"]).start {(connection, result, err) in
            if err != nil{
                print("Failed",err ?? "")
                return
            }
            
            
        }
        
     
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
}

