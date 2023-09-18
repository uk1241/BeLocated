//
//  onBoardingViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 07/09/23.
//

import UIKit
import FacebookLogin

class onBoardingViewController: UIViewController {
    @IBOutlet var emailSignInBtn: UIButton!
    @IBOutlet var googleSignInBtn: UIButton!
    @IBOutlet var facebookSignInBtn: UIButton!
    @IBOutlet var appleSignInBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        emailSignInBtn.makeRounded()
        googleSignInBtn.makeRounded()
        facebookSignInBtn.makeRounded()
        appleSignInBtn.makeRounded()
        
        emailSignInBtn.addTarget(self, action: #selector(emailSignIN), for: .touchUpInside)
        googleSignInBtn.addTarget(self, action: #selector(googleSignIN), for: .touchUpInside)
        facebookSignInBtn.addTarget(self, action: #selector(facebookSignIN), for: .touchUpInside)
        appleSignInBtn.addTarget(self, action: #selector(appleSignIN), for: .touchUpInside)
    }
    
    @objc func emailSignIN()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(loginVc, animated: true)
        }
    }
    @objc func googleSignIN()
    {
        
    }
    @objc func facebookSignIN()
    {
        // Trigger Facebook login when the button is tapped
           let loginManager = LoginManager()
           loginManager.logIn(permissions: [.publicProfile, .email], viewController: self) { loginResult in
               switch loginResult {
               case .success(_, _, let token):
                   // Facebook login was successful, you can access the token here
                   print("Facebook login successful. Token: \(token.tokenString)")
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let mainVc = storyboard.instantiateViewController(withIdentifier: "AlertViewController") as! LoginViewController

                   if let navigationController = self.navigationController {
                       navigationController.pushViewController(mainVc, animated: true)
                   }
                   
                   // You can use the token to make requests to the Facebook Graph API or perform other tasks.
               case .failed(let error):
                   // Handle login failure
                   print("Facebook login failed with error: \(error.localizedDescription)")
               case .cancelled:
                   // Handle user cancellation
                   print("Facebook login was cancelled")
               }
           }
    }
    @objc func appleSignIN()
    {
        
    }

}
//extension onBoardingViewController: LoginButtonDelegate {
//    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//        if let error = error {
//            // Handle login error
//            print("Facebook login error: \(error.localizedDescription)")
//        } else if result?.isCancelled == true {
//            // Handle user cancellation
//            print("Facebook login was cancelled")
//        } else {
//            // Handle successful login
//            if let token = AccessToken.current {
//                print("Logged in with Facebook. Token: \(token)")
//
//                // You can use the token to make requests to the Facebook Graph API or perform other tasks.
//            }
//        }
//    }
//
//    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//        // Handle logout here
//        print("Logged out from Facebook")
//    }
//}
