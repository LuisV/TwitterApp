//
//  LoginViewController.swift
//  Twitter
//
//  Created by Luis Valencia on 2/11/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let URL = "https://api.twitter.com/oauth/request_token"
    @IBAction func onLoginButton(_ sender: Any) {
        TwitterAPICaller.client?.login(url: URL, success: {
            UserDefaults.standard.set(true, forKey: "loggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in")
        })
    }
     
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.bool(forKey: "loggedIn") == true){
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
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
