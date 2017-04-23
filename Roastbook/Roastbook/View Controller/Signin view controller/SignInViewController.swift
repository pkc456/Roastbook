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
    
    override func viewDidLoad() {
//        instagramLikeAnimation()
    }
    
    func instagramLikeAnimation(){
        let colors = Colors()
        
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    

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
        let loginNavController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeNavigationController")        
        APP_DELEGATE.window?.rootViewController = loginNavController
//
    }
    
    
    //MARK: instagram graphic effect
    class Colors {
        var gl:CAGradientLayer!
        
        init() {
            let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
            
            self.gl = CAGradientLayer()
            self.gl.colors = [colorTop, colorBottom]
            self.gl.locations = [0.0, 1.0]
        }
    }
}
