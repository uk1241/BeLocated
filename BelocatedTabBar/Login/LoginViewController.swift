//
//  LoginViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 30/08/23.
//

import UIKit
import TextFieldFloatingPlaceholder
import SkyFloatingLabelTextField
import IQKeyboardManagerSwift
class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var passwordTextField :SkyFloatingLabelTextField!
    @IBOutlet var passwordHideButton : UIButton!
    @IBOutlet var loginButton : UIButton!
    @IBOutlet var sigUpButton: UIButton!
    var alertMessage = ""
    @IBOutlet weak var yellowViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var enterTheEmailLabel: UILabel!
    
    var toggleState = false
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        yellowViewHeight.constant = 650 //473 actually
        titleImageTopConstraint.constant = 100
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        yellowViewHeight.constant = 473
        titleImageTopConstraint.constant = 23
//        setupCustomNavigationBar()
        loginButton.makeRounded()
       enterTheEmailLabel.setLineSpacing()
       IQKeyboardManager.shared.keyboardDistanceFromTextField = 100
    }

    @IBAction func LoginButtonTapped()
    {
        guard !emailTextField.validateTextField(textFieldType: .normal) else{
                    alertMessage = AppAlertMsg.EMAIL_OR_PASSWORD_EMPTY
                     showAlert()
                    return
                }
                guard  emailTextField.validateTextField(textFieldType: .email) else{
                alertMessage = AppAlertMsg.INVALID_EMAIL
                     showAlert()
                    return
                }
    }
    
    func showAlert(){
        self.showAlertOk(message: alertMessage)
    }
    @IBAction func backBtnAction(_ sender: Any) {
        yellowViewHeight.constant = 473
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            
        }
        yellowViewHeight.constant = 300
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            
        }
//        self.navigationController?.popViewController(animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SignUpVc = storyboard.instantiateViewController(withIdentifier: "onBoardingViewController") as! onBoardingViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(SignUpVc, animated: true)
        }

    }
    @IBAction func passwordhideButtonTapped ()
    {
        if toggleState == false{
            passwordTextField.isSecureTextEntry = false
            passwordHideButton.setImage(UIImage(named: "passwordDefaultstate"), for: .normal)
            toggleState = true
        }
        else
        {
            passwordHideButton.setImage(UIImage(named: "passwordTogglestate"), for: .normal)
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
 
    @IBAction func forgotPasswordAction(_ sender: Any) {
        UIView.animate(withDuration: 0.6) {
                    self.view.layoutIfNeeded()
                }
        let menu = ForgotPassWrdViewController()
        menu.modalPresentationStyle = .overCurrentContext
        menu.modalTransitionStyle = .coverVertical
       // forgotPasswordVC.modalPresentationStyle = .overFullScreen
        present(menu, animated: false, completion: nil)
        

    }
    
    
//    func dismissPopUpView(){
//        let menuS = LinkSentViewController()
//        menuS.modalPresentationStyle = .overCurrentContext
//        menuS.modalTransitionStyle = .coverVertical
//        present(menuS, animated: false, completion: nil)
//        UIView.animate(withDuration: 0.3) {
//                    self.view.layoutIfNeeded()
//                }
//    }

    
    
    
    
}
extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        emailTextField.resignFirstResponder()
        return true
    }
    
    
    
}
