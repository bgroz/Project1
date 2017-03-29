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

class ViewController: UIViewController {
   
    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    @IBOutlet weak var btnLoginWithTwitter: UIButton!
    @IBAction func BtnSender(_ sender: Any) {
        
       
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "SWRevealViewController", bundle:nil)
        
        let SWRevealViewController = storyBoard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        self.present(SWRevealViewController, animated:true, completion:nil)
        
        
        
    }
        
    /*    if revealViewController()  != nil {
            btnMenuBar.target = self.revealViewController()
            btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }

       */
   
      override func viewDidLoad() {
        super.viewDidLoad()
        
       // btnMenuBar.target = self.revealViewController()
        //btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        
        
        
        
        
        
        
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

