//
//  NavigationBarExtension.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 08/03/22.
//

import Foundation
import UIKit

extension UIViewController
{
    func setNavigationBarWithLogoAndRightButtons()
    {
        navigationViewWithShadow()
        // setting the navigation bar
//        let logoutButton = UIButton()
//        var navView = UIView()
//
//
//        navView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  100))
//        navView.layer.masksToBounds = false
//       // navView.backgroundColor = UIColor.green
//        self.view.addSubview(navView)
//
//        //setting the logo
//        let logoImage = UIImage.init(named: "navLogo")
//        let logoImageView = UIImageView.init(image: logoImage)
//        logoImageView.frame = CGRect(x: 20, y: 50, width: 150, height: 42)
//        logoImageView.contentMode = .scaleAspectFit
//        self.view.addSubview(logoImageView)
//
//
//
//        // logout button
//
//
//        logoutButton.frame = CGRect(x: UIScreen.main.bounds.width - 55, y: 50, width: 30, height: 30)
//        logoutButton.setBackgroundImage(nil, for: .normal)
//        logoutButton.setImage(nil, for: .normal)
//        logoutButton.setImage(UIImage(named: "sideMenu"), for: .normal)
//        logoutButton.addTarget(self, action: #selector(logoutBtnTapped(sender:)), for: .touchUpInside)
//        self.view.addSubview(logoutButton)
    
        
        
    }
    func setNavigationBarWithLogout() {
            self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
            let btnBack = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
            btnBack.image = UIImage(named: "navLogo")
            let backButton = UIBarButtonItem(customView: btnBack)
            
            navigationItem.leftBarButtonItem = backButton
            //Back Button
            let logout = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            logout.setImage(UIImage(named:"sideMenu"), for: .normal)
            logout.addTarget(self, action: #selector(sideMenuAction), for: UIControl.Event.touchUpInside)
            let logOutBtn = UIBarButtonItem(customView: logout)
            self.navigationItem.rightBarButtonItem = logOutBtn
            //navigation title
//            self.navigationItem.title = ""
//            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name:"SFUIDisplay-Bold", size: 16)!]
//            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.barTintColor = UIColor.white
        navigationViewWithShadow()
            
        }
    @objc func sideMenuAction(sender:UIButton)
    {
        
    }
    
    @objc func filterBtnTapped(sender:UIButton)
    {
        
    }
    @objc func rightBtnTapped(sender:UIButton)
    {
        print("right button tapped")
    }
    
    @objc func logoutBtnTapped(sender:UIButton)
    {
        //print("right button tapped")
    }
    
    
    func setClearNavigationBarWithBackAndName(name:String,fontName:String = "",fontSize:CGFloat = 0.0,isBack:Bool = true,image:String)
    {
        //Back Button
        let btnback = UIButton(frame: CGRect(x: 0, y: 20, width: 24, height: 24))
        btnback.setBackgroundImage(UIImage(named: image), for: .normal)
        btnback.addTarget(self, action: #selector(performSegueToReturnBack), for: .touchUpInside)
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 260, height: 30))
        nameLabel.text = name
        //nameLabel.backgroundColor = .red
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor().colorFromHexString("#464646")
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        if fontName == "" && fontSize == 0.0{
            nameLabel.font = UIFont(name: "ProximaNova-Regular", size: 22)
        }else{
            nameLabel.font = UIFont(name: fontName, size: fontSize)
        }
        let nameView = UIView(frame: CGRect(x: 5, y: 0, width: 260, height: 30))
        nameView.backgroundColor = .clear
        nameView.addSubview(nameLabel)
        self.navigationItem.titleView = nameView
        //self.title = name
       // NavBottomBarWithLine()
        navigationViewWithShadow()
        let rightBarButton = UIBarButtonItem()
        self.navigationItem.rightBarButtonItem = rightBarButton
       // let barBtnName = UIBarButtonItem(customView: nameView)
        let barBtnback = UIBarButtonItem(customView: btnback)
        self.navigationItem.leftBarButtonItems = [barBtnback]
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        // self.setStatusBarBackgroundColor(color: UIColor.clear)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    @objc func performSegueToReturnBack()  {
            
            if let nav = self.navigationController {
                nav.popViewController(animated: true)
                
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    
    func setClearNavigationBarBackNameAndButt(name:String,txtColor:UIColor,backgroundColor:UIColor,buttonTitle:String,buttonFontSize:CGFloat){
            //Back Button
            let btnback = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            btnback.setBackgroundImage(UIImage(named: "backImage"), for: .normal)
            btnback.addTarget(self, action: #selector(performSegueToReturnBack), for: .touchUpInside)
            let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 260, height: 30))
            
            nameLabel.text = name
            nameLabel.textColor = UIColor(red: 42/255.0, green: 51/255.0, blue: 62/255.0, alpha: 1)
            nameLabel.textAlignment = .center
            nameLabel.adjustsFontSizeToFitWidth = true
            nameLabel.minimumScaleFactor = 0.2
            nameLabel.font = UIFont(name: "Poppins-Regular", size: 18)
            let nameView = UIView(frame: CGRect(x: 0, y: 0, width: 260, height: 30))
            nameView.backgroundColor = .clear
            nameView.addSubview(nameLabel)
            self.navigationItem.titleView = nameView
            let barBtnback = UIBarButtonItem(customView: btnback)
            self.navigationItem.leftBarButtonItems = [barBtnback]
            
            let joinButton = UIButton(frame: CGRect(x: 0, y: 0, width: 77, height: 28))
            joinButton.setTitle(buttonTitle, for: .normal)
            joinButton.backgroundColor = backgroundColor
            joinButton.setTitleColor(txtColor, for: .normal)
            joinButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: buttonFontSize)
            joinButton.widthAnchor.constraint(equalToConstant: 77).isActive = true
            joinButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
            joinButton.contentMode = .scaleToFill
            joinButton.addTarget(self, action: #selector(self.postFilterDataSelected), for: .touchUpInside)
            joinButton.layer.cornerRadius = 6
            joinButton.clipsToBounds = true
            let joinbutnCustom = UIBarButtonItem(customView: joinButton)
            self.navigationItem.rightBarButtonItems = [joinbutnCustom]
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.backgroundColor = UIColor.white
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            NavBottomBarWithLine()
        }
    
    func NavBottomBarWithLine()
    {
        var Yvalue = CGFloat()
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        if height >= 812
        {
            Yvalue = 101
        }
        else
        {
            Yvalue = 70
        }
        var navViewBottomLine = UIView()
        navViewBottomLine = UIView(frame: CGRect(x: 0, y: Yvalue, width: self.view.frame.width, height:  1))
        navViewBottomLine.layer.masksToBounds = false
        navViewBottomLine.backgroundColor = UIColor().colorFromHexString("#8FB0BE").withAlphaComponent(0.25)
        self.view.addSubview(navViewBottomLine)
    }
    
    @objc func postFilterDataSelected()
    {
        
    }
    
    func navigationViewWithShadow()
    {
        var shadowView = UIView()
        var screenHeight = CGFloat()
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        if height >= 812
        {
            screenHeight = 100
        }
        else
        {
            screenHeight = 70
        }
        shadowView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: screenHeight))
       
        shadowView.layer.masksToBounds = false
       
        shadowView.backgroundColor = UIColor.white
       
        shadowView.layer.shadowColor=UIColor().colorFromHexString("#8D583422").cgColor
        shadowView.layer.shadowOpacity = 5
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOffset = CGSize.zero
        self.view.addSubview(shadowView)
    }

}

extension UINavigationController {
    func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        pushViewController(viewController, animated: animated)

        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }

    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        popViewController(animated: animated)

        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
