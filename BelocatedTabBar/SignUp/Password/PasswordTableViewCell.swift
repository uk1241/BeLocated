//
//  PasswordTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 31/08/23.
//

import UIKit

class PasswordTableViewCell: UITableViewCell {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var minimumCharbutton: UIButton!
    @IBOutlet var specialCharButton: UIButton!
    @IBOutlet var oneNumberButton: UIButton!
    @IBOutlet var confirmPaswordTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var confirmPasswordeye: UIButton!
    @IBOutlet var passwordEye: UIButton!
    var toggleState = false
    override func awakeFromNib() {
        super.awakeFromNib()
        continueButton.makeRounded()
        passwordTextField.delegate = self
        minimumCharbutton.isUserInteractionEnabled = true
        confirmPaswordTextField.isHidden = true
        continueButton.isHidden = true
        confirmPasswordeye.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func passwordEyeAction()
    {
       if toggleState == false
        {
           passwordTextField.isSecureTextEntry = false
           toggleState = true
       }
        else
        {
            passwordTextField.isSecureTextEntry = true
            toggleState = false
        }
        
    }
    
}
extension PasswordTableViewCell :UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = passwordTextField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
            validatePassword(password: updatedText)
        }
        return true
    }
    func hasMinimumCharacters(password: String) -> Bool {
        return password.count >= 8
    }

    func hasSpecialCharacter(password: String) -> Bool {
        let specialCharacterRegex = ".*[/!@#$%^&*].*"
        return NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex).evaluate(with: password)
    }

    func hasNumber(password: String) -> Bool {
        let numberRegex = ".*[0-9].*"
        return NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: password)
    }

    func validatePassword(password: String) {
        let minimumCharValid = hasMinimumCharacters(password: password)
        let specialCharValid = hasSpecialCharacter(password: password)
        let numberValid = hasNumber(password: password)
        
        minimumCharbutton.setImage(minimumCharValid ? UIImage(named: "password tick") : UIImage(named: "password red"), for: .normal)
        specialCharButton.setImage(specialCharValid ? UIImage(named: "password tick") : UIImage(named: "password red"), for: .normal)
        oneNumberButton.setImage(numberValid ? UIImage(named: "password tick") : UIImage(named: "password red"), for: .normal)
        
        if minimumCharValid && specialCharValid && numberValid {
            continueButton.isHidden = false
            confirmPaswordTextField.isHidden = false
        } else {
            continueButton.isHidden = true
            confirmPaswordTextField.isHidden = true
            confirmPasswordeye.isHidden = true
        }
    }

}
