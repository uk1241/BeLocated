//
//  UIViewExtension.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 03/03/22.
//

import Foundation
import UIKit



extension UIView
{
    
   
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius;
        }
        set(value) {
            layer.cornerRadius = value;
        }
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
  func hideorShow(_ isHide:Bool)
        {
            UIView.animate(withDuration: 0.3) {
                self.isHidden = isHide
                self.layoutIfNeeded()
            }
        }
        func hideWithConstrain( constrain:NSLayoutConstraint, value:CGFloat ,_ isHide:Bool)
        {
            UIView.animate(withDuration: 0.3) {
                self.isHidden = isHide
                constrain.constant = value
                self.layoutIfNeeded()
            }
        }
        
        @IBInspectable var ShadowOpacity: Float {
                 get {
                     return layer.shadowOpacity
                 }
                 set {
                     layer.shadowOpacity = newValue
                 }
             }
        
        @IBInspectable
           var shadowRadius: CGFloat {
               get {
                   return layer.shadowRadius
               }
               set {

                layer.shadowRadius = newValue
               }
           }
        
             @IBInspectable var ShadowColor: UIColor {
                 get {
                     return UIColor(cgColor: layer.shadowColor!)
                 }
                 set {
                     layer.shadowColor = newValue.cgColor
                 }
             }
        @IBInspectable
            var shadowOffset : CGSize{

                get{
                    return layer.shadowOffset
                }set{

                    layer.shadowOffset = newValue
                }
            }
        
        
        @IBInspectable var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
        
        @IBInspectable var borderColor: UIColor? {
            get {
                return UIColor(cgColor: layer.borderColor!)
            }
            set {
                layer.borderColor = newValue?.cgColor
            }
        }
    }



