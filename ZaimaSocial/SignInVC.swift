//
//  SignInVC.swift
//  ZaimaSocial
//
//  Created by Ahmed Zaima on 22/01/2017.
//  Copyright © 2017 Ahmed Zaima. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func facebookButtonPressed(_ sender: RoundButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to Authenticate with facebook - \(error)")
            }   else if result?.isCancelled == true {
                print("User Cancelled Facebook Authentication")
            }   else {
                print("Successfully Authenticates Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to authenticate with Firebase - \(error)")
            }   else {
                print("Successfully Authenticated with Firebase")
            }
        })
    }
    

}

