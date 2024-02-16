//
//  UIViewControllerExtension.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 28/03/22.
//

import Foundation
import UIKit
import Alertift

extension UIViewController
{

//func alert(_ message:String ,_ buttons:[UIAlertAction]?,title:String = AppDetails.APP_NAME)
//{
//    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    if(buttons == nil)
//    {
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//    }
//    else
//    {
//        for button in buttons!
//        {
//            alert.addAction(button)
//        }
//    }
//    self.present(alert, animated: true, completion: nil)
//}
//    func showAlertOk(message:String,isDefaultTitle:Bool=true){
//        let alert = UIAlertController(title: "Girfalco", message: message, preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//    func showhideHUD(viewtype: SHOWHIDEHUD,title: String)
//    {
//        switch viewtype {
//        case .SHOW:
//            CAXSVProgressHUD.show(title:title)
//        case .HIDE:
//            CAXSVProgressHUD.dismiss()
//        }
//    }
    
    func alert(_ message:String ,_ buttons:[UIAlertAction]?,title:String = AppDetails.APP_NAME)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if(buttons == nil)
        {
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        }
        else
        {
            for button in buttons!
            {
                alert.addAction(button)
            }
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertOk(message:String,isDefaultTitle:Bool=true){
        Alertift.alert(title: isDefaultTitle ? AppDetails.APP_NAME : "Oops!",message:message)
            .action(.default("OK"))
            .show()
    }
    func randomString(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map{ _ in letters.randomElement()! })
        }
}

public extension UIApplication {
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

extension Date {

 static func CurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy/dd/mm"

        return dateFormatter.string(from: Date())

    }
}
