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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: USER_UID) {
            
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }

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
                if let user = user {
                    self.completeSignin(id: user.uid)
                }
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Ahmed: User Authenticated with firebase by email")
                    if let user = user {
                        self.completeSignin(id: user.uid)
                    }
                }   else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Ahmed: Unable to authenticate with email")
                        }   else {
                            print("Successfully authenticated with firebase by creating user")
                            if let user = user {
                                self.completeSignin(id: user.uid)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignin(id: String) {
        KeychainWrapper.standard.set(id, forKey: USER_UID)
        performSegue(withIdentifier: "goToFeed", sender: nil)
        
    }

}

