//
//  ScoreViewController.swift
//  menu
//
//  Created by Buğra on 12.03.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var btnMenuBar: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnMenuBar.target = SWRevealViewController()
        btnMenuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
