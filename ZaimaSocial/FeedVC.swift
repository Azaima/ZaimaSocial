//
//  FeedVC.swift
//  ZaimaSocial
//
//  Created by Ahmed Zaima on 27/01/2017.
//  Copyright © 2017 Ahmed Zaima. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signOutPressed(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: USER_UID)
        try! FIRAuth.auth()?.signOut()
        print("Signed Out Successfully")
        dismiss(animated: true, completion: nil)
        
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
