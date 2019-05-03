//
//  FeedViewController.swift
//  MeMyself-I
//
//  Created by Hao on 5/2/19.
//  Copyright © 2019 Hao. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func OnLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name:"Main", bundle:nil)
        let HomeViewController = main.instantiateViewController(withIdentifier: "HomeViewController")
        
        let delegat = UIApplication.shared.delegate as! AppDelegate
        
        delegat.window?.rootViewController = HomeViewController
}
}
