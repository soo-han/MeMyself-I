//
//  SignInViewController.swift
//  MeMyself-I
//
//  Created by user148140 on 4/12/19.
//  Copyright © 2019 Hao. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

 
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var Password: UILabel!
    
    @IBOutlet weak var UsernameText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    
    @IBAction func signin(_ sender: Any) {
        
        let Username = UsernameText.text!
        let Password = PasswordText.text!
        
        PFUser.logInWithUsername(inBackground: Username, password: Password)
        { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "SignInSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
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

}
