//
//  UITextFieldExtension.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 30/03/22.
//

import Foundation
import UIKit

extension UITextField {
    enum TextFieldType:String {
          case normal
          case email
      }
    
    func validateTextField(textFieldType:TextFieldType,characterLimit:Int = 0) -> Bool{
        switch textFieldType {
        case .normal: return (characterLimit==0 ? (self.text!.trimmingCharacters(in:.whitespaces).isEmpty ? true : false) : (self.text!.count >= characterLimit ? false : true))
        case .email: return self.text!.isValidEmail()
        }
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    
        func setLeftPaddingPoints(_ amount:CGFloat){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    
}
extension UITextView {
    func leftSpace() {
        self.textContainerInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 20)
    }
}



@IBDesignable
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var insetX: CGFloat = 0
       @IBInspectable var insetY: CGFloat = 0

       // placeholder position
       override func textRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.insetBy(dx: insetX, dy: insetY)
       }

       // text position
       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.insetBy(dx: insetX, dy: insetY)
       }
    
    
    @IBInspectable var leftPadding: CGFloat = 20
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 25, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    
}
