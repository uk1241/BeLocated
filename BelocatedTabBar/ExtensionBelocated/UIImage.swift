//
//  UIImage.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 04/03/22.
//

import Foundation
import UIKit

extension UIImage {
func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage {
UIGraphicsBeginImageContextWithOptions(size, false, 0)
color.setFill()
UIRectFill(CGRect(x: 0, y: size.height - lineWidth, width: size.width, height: lineWidth))
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
return image!
}
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}

extension UIImage {
    func convertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
}


