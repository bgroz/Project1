//
//  MainViewController.swift
//  CrossWordGame
//
//  Created by Buğra on 30.03.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnMenuBar.target = SWRevealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
       // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
