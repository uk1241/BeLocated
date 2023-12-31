//
//  LoginViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 30/08/23.
//

import UIKit
import TextFieldFloatingPlaceholder
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var passwordTextField :SkyFloatingLabelTextField!
    @IBOutlet var passwordHideButton : UIButton!
    @IBOutlet var loginButton : UIButton!
    @IBOutlet var sigUpButton: UIButton!
    var toggleState = false
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        setupCustomNavigationBar()
        loginButton.makeRounded()
    }
    @IBAction func LoginButtonTapped()
    {
        //do something
    }
    @IBAction func passwordhideButtonTapped ()
    {
        if toggleState == false{
            passwordTextField.isSecureTextEntry = false
            passwordHideButton.setImage(UIImage(named: "passwordTogglestate"), for: .normal)
            toggleState = true
        }
        else
        {
            passwordHideButton.setImage(UIImage(named: "passwordDefaultstate"), for: .normal)
            passwordTextField.isSecureTextEntry = true
            toggleState = false
        }
    }
    @IBAction func signUpButtonTapped ()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SignUpVc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(SignUpVc, animated: true)
        }
    }
 
}
extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        emailTextField.resignFirstResponder()
        return true
    }
    
    
}
