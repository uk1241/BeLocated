//
//  SignUpViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 30/08/23.
//

import UIKit

class SignUpViewController: UIViewController {
    //MARK: -  signUp stage button outlets
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonFive: UIButton!
    @IBOutlet var buttonSix: UIButton!
    @IBOutlet var buttonSeven: UIButton!
    //MARK: - cells variables
    var contactCellVisible = false
    var mailCellVisible = false
    var passwordCellVisible = false
    var addressCellVisible = false
    @IBOutlet var signUpTableview: UITableView!
    @IBOutlet var bgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        //Register The cells
        signUpTableview.register(UINib(nibName: "PersonalDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalDetailsTableViewCell")
        signUpTableview.register(UINib(nibName: "contactDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "contactDetailsTableViewCell")
        signUpTableview.register(UINib(nibName: "MailDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MailDetailsTableViewCell")
        signUpTableview.register(UINib(nibName: "PasswordTableViewCell", bundle: nil), forCellReuseIdentifier: "PasswordTableViewCell")
        signUpTableview.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
        //AddressTableViewCell
        
    }
}
extension SignUpViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if contactCellVisible == false
        {
            let personaldetailcell = tableView.dequeueReusableCell(withIdentifier: "PersonalDetailsTableViewCell", for: indexPath) as! PersonalDetailsTableViewCell
            personaldetailcell.signIn.addTarget(self, action: #selector(SignINbuttonTap), for: .touchUpInside)
            personaldetailcell.continueBtn.addTarget(self, action: #selector(ContinueBtnTapped), for: .touchUpInside)
            buttonOne.setImage(UIImage(named: "btnStateOne"), for: .normal)
            return personaldetailcell
        }
        else if mailCellVisible == false
        {
            let contactdetailcell = tableView.dequeueReusableCell(withIdentifier: "contactDetailsTableViewCell", for: indexPath) as! contactDetailsTableViewCell
            contactdetailcell.continueBtn.addTarget(self, action: #selector(ContinueBtnTap), for: .touchUpInside)
            return contactdetailcell
        }
        else if passwordCellVisible == false
        {
            let maildetailcell = tableView.dequeueReusableCell(withIdentifier: "MailDetailsTableViewCell", for: indexPath) as! MailDetailsTableViewCell
            maildetailcell.continueButton.addTarget(self, action: #selector(ContinueTap), for: .touchUpInside)
            return maildetailcell
        }
        else if addressCellVisible == false
        {
            let passwordCell = tableView.dequeueReusableCell(withIdentifier: "PasswordTableViewCell", for: indexPath) as! PasswordTableViewCell
            passwordCell.continueButton.addTarget(self, action: #selector(toAddressPage), for: .touchUpInside)
            return passwordCell
        }
        else
        {
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
            addressCell.getcurrentLoactionButton.addTarget(self, action: #selector(getcurrentAddress), for: .touchUpInside)
            return addressCell
        }
            
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540
    }
    @objc func SignINbuttonTap()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SignInVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(SignInVc, animated: true)
        }
        
    }
    @objc func ContinueBtnTapped()
    // for passing to phone number page
    {
        contactCellVisible = true
        signUpTableview.reloadData()
        bgImageView.image = UIImage(named: "contactDetailsBg")
        buttonOne.setImage(UIImage(named: "buttonStateTwo"), for: .normal)
        buttonTwo.setImage(UIImage(named: "btnStateOne"), for: .normal)
    }
    @objc func ContinueBtnTap()
    // for passing to email page
    {
        mailCellVisible = true
        signUpTableview.reloadData()
        bgImageView.image = UIImage(named: "mailDetailsBg")
        buttonTwo.setImage(UIImage(named: "buttonStateTwo"), for: .normal)
        buttonThree.setImage(UIImage(named: "btnStateOne"), for: .normal)
    }
    @objc func ContinueTap()
    // for passing to create password page
    {
        passwordCellVisible = true
        signUpTableview.reloadData()
        bgImageView.image = UIImage(named: "passwordBg")
        buttonThree.setImage(UIImage(named: "buttonStateTwo"), for: .normal)
        buttonFour.setImage(UIImage(named: "btnStateOne"), for: .normal)
    }
    @objc func  toAddressPage()
    {
        addressCellVisible = true
        signUpTableview.reloadData()
        bgImageView.image = UIImage(named: "addressBg")
        buttonFour.setImage(UIImage(named: "buttonStateTwo"), for: .normal)
        buttonFive.setImage(UIImage(named: "btnStateOne"), for: .normal)
    }
    @objc func  getcurrentAddress()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewVc = storyboard.instantiateViewController(withIdentifier: "mapViewController") as! mapViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(mapViewVc, animated: true)
        }
    }
   
}
