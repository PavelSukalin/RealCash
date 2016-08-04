//
//  SignInController.swift
//  RealCasino
//
//  Created by Pavel Sukalin on 8/3/16.
//  Copyright © 2016 Pavel Sukalin. All rights reserved.
//

import UIKit

class SignInController: UIViewController {
    
    @IBOutlet weak var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let manager = FacebookManager()
        manager.singInFacebook(self, rectButton: facebookButton.frame) { (isDone, error) in
            if ((error) != nil){
                self.toHomeScreen();
            }
        }
    }
    
    // MARK: - Staff
    
    func toHomeScreen() {
        self.performSegueWithIdentifier(Constants.segue.SignInToHome, sender: self)
    }
    
    // MARK: - Actions
    
    @IBAction func facebookAction(sender: AnyObject) {
        self.toHomeScreen();
    }
}