//
//  LoginWithFacebook.swift
//   
//
//  Created by Bartuğ Maden on 13/03/2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import Foundation
import FBSDKLoginKit


class LoginWithFacebook: ViewController {
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).start { (connection, result, error) -> Void in
            
        }
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        
    }
    
    func configureFacebook()
    {
        // btnLoginWithFacebook.readPermissions = ["public_profile", "email", "user_friends"];
        //  btnLoginFacebook.delegate = self
    }

}









