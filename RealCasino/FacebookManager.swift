//
//  FacebookManager.swift
//  RealCasino
//
//  Created by Pavel Sukalin on 8/3/16.
//  Copyright © 2016 Pavel Sukalin. All rights reserved.
//

import UIKit

class FacebookManager: NSObject, FBSDKLoginButtonDelegate {

    var completionHandler : ((Bool, NSError?) -> Void)!
    
    internal func signInWithFacebook() {
        
    }
    
    // MARK: - Facebook Methods
    
    func singInFacebook(controller: UIViewController!, rectButton: CGRect, completionHandler :(Bool, NSError?) -> Void)  {
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            completionHandler(true, nil);
        } else {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            controller.view.addSubview(loginView)
            loginView.frame = CGRectMake(controller.view.center.x - rectButton.size.width/2,
                                         rectButton.origin.y,
                                         rectButton.size.width,
                                         rectButton.size.height);
            loginView.readPermissions = ["public_profile", "email"]
            loginView.delegate = self
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            completionHandler(false, error);
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
}
