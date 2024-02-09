////
////  ToolTipView.swift
////  BelocatedTabBar
////
////  Created by R Unnikrishnan on 23/08/23.
////
//
//import UIKit
//
//class ToolTipView: UIView {
//   
//    var roundRect:CGRect!
//    let toolTipWidth : CGFloat = 20.0
//    let toolTipHeight : CGFloat = 12.0
//    let tipOffset : CGFloat = 20.0
//    var tipPosition : ToolTipPosition = .middle
//    
//    enum ToolTipPosition : Int
//    {
//        case left
//        case right
//        case middle
//        case top
//        case bottom
//    }
//    
//    
//    convenience init(frame: CGRect, text : String, tipPos: ToolTipPosition)
//    {
//        self.init(frame: frame)
//        self.tipPosition = tipPos
//    }
//    roundRect = CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height — toolTipHeight)
//    let roundRectBez = UIBezierPath(roundedRect: roundRect, cornerRadius: 5.0)
//   
//
//}
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        validationButton.isUserInteractionEnabled = false
        validationButton.backgroundColor = .lightGray
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = passwordTextField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
            validatePassword(password: updatedText)
        }
        return true
    }
    
    func validatePassword(password: String) {
        let passwordRegex = "^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        if passwordPredicate.evaluate(with: password) {
            validationButton.setTitle("Password is valid.", for: .normal)
            validationButton.backgroundColor = .green
            validationButton.setTitleColor(.white, for: .normal)
        } else {
            validationButton.setTitle("Password must have at least 8 characters, one special character, and one number.", for: .normal)
            validationButton.backgroundColor = .red
            validationButton.setTitleColor(.white, for: .normal)
        }
    }
}


