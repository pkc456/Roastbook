//
//  SignInViewController.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/29/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController
{
        
    @IBAction func btnDismissAction(_ sender: UIButton) {
        saveData()
        setHomeView()
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func saveData() {
        let jsonData = [KKEY_USER_NAME:"pardeep"]
        let userdetail : UserDetail = UserDetail(restDic: jsonData as NSDictionary)
        APP_DELEGATE.userDetail = userdetail
        Utility.sharedInstance.saveUserDetails()        
    }
    
    func setHomeView(){
        //save user detail
        let loginNavController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarNavigationController")        
        APP_DELEGATE.window?.rootViewController = loginNavController
//
    }
    
}
