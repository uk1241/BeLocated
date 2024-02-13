//
//  ForgotPassWrdViewController.swift
//  BelocatedTabBar
//
//  Created by Samuel Sajeev on 12/02/24.
//

import UIKit
import SkyFloatingLabelTextField
var readEmailfrmTxtFld = ""

class ForgotPassWrdViewController: UIViewController ,UITextFieldDelegate,LinkSentViewControllerDelegate{
    func linkSentViewControllerDidDismiss() {
        self.dismiss(animated: false, completion: nil)
    }

    @IBOutlet weak var forGotPassHeading: UILabel!
    @IBOutlet weak var sendResetLinkBtnOutlet: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emailTextfld: SkyFloatingLabelTextField!
    @IBOutlet weak var enterYourRegSubText: UILabel!
    
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    // sec view outlets
    @IBOutlet weak var emailMobileTextLabel: UILabel!
    @IBOutlet weak var passingMailLabel: UILabel!
    @IBOutlet weak var resendDashLine: UILabel!
    @IBOutlet weak var resendBtnAction: UIButton!
    @IBOutlet weak var verificationBtn: UIButton!
    @IBOutlet weak var emailBackgroundView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var secViewBackGround: UIView!
    /Users/samuelsajeev/Documents/0.3/BeLocatedtabBar-main.zip
    // constraints animation
    @IBOutlet weak var activationleft: NSLayoutConstraint!
    @IBOutlet weak var activationRight: NSLayoutConstraint!
    @IBOutlet weak var resendLeft: NSLayoutConstraint!
    @IBOutlet weak var dashLineLeft: NSLayoutConstraint!
    @IBOutlet weak var secViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sendResetLinkBtnOutlet.layer.cornerRadius = sendResetLinkBtnOutlet.frame.height / 2
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 24
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner]
        //emailTextfld.font = UIFont.systemFont(ofSize: 17)
        //emailTextfld.font = UIFont(name: "Gilroy-Regular", size: 13)
        emailTextfld.font = UIFont(name: "Gilroy-Medium", size: 17)
        emailTextfld.lineHeight = 1
        emailTextfld.lineView.isHidden = false
        emailTextfld.lineColor = UIColor(red: 70/255, green: 58/255, blue: 8/255, alpha: 1)
        emailTextfld.delegate = self
        
        // sec view
        verificationBtn.isHidden = true
        doneBtn.layer.cornerRadius = doneBtn.frame.height / 2
        verificationBtn.layer.cornerRadius = verificationBtn.frame.height / 2
        secViewBackGround.clipsToBounds = true
        secViewBackGround.layer.cornerRadius = 24
        secViewBackGround.layer.maskedCorners = [.layerMaxXMinYCorner]
        passingMailLabel.text = readEmailfrmTxtFld
        activationleft.constant = 40
        activationRight.constant  = 60
        emailBackgroundView.layer.cornerRadius = emailBackgroundView.frame.height / 2
        secViewHeight.constant = 0
        if let integerValue = Int(readEmailfrmTxtFld) {
            emailMobileTextLabel.text = "Click on the link we have sent to your phone number to reset your password"
        } else {
            emailMobileTextLabel.text = "We have sent you an email with a link to reset your password"
        }
    
    }

    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    func dismissPopUpView(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func sndResetLinkBtnAction(_ sender: Any) {
        backgroundView.backgroundColor = UIColor.clear
        cancelBtnOutlet.isHidden = true
        forGotPassHeading.isHidden = true
        enterYourRegSubText.isHidden = true
        emailTextfld.isHidden = true
        sendResetLinkBtnOutlet.isHidden = true
        secViewBackGround.isHidden = false
        secViewHeight.constant = 301
                UIView.animate(withDuration: 0.3) {
                            self.view.layoutIfNeeded()
                        }
            }
        
    
    // second View Button actions
    @IBAction func resendAction(_ sender: Any) {
        activationleft.constant = 55
        activationRight.constant  = 55
        resendLeft.constant = 45
        dashLineLeft.constant = 45
        verificationBtn.isHidden = false
        resendBtnAction.isHidden = true
        resendDashLine.isHidden = true
        doneBtn.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func verificationAction(_ sender: Any) {
        verificationBtn.isHidden = true
        resendBtnAction.isHidden = false
        resendDashLine.isHidden = false
        doneBtn.isHidden = false
        activationleft.constant = 40
        activationRight.constant  = 60
        resendLeft.constant = 32
        dashLineLeft.constant = 32
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
    }
    @IBAction func doneBtnAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
  
    @IBAction func editBtnAction(_ sender: Any) {
        backgroundView.backgroundColor = UIColor.white
        cancelBtnOutlet.isHidden = false
        forGotPassHeading.isHidden = false
        enterYourRegSubText.isHidden = false
        sendResetLinkBtnOutlet.isHidden = false
        emailTextfld.isHidden = false
        secViewBackGround.isHidden = true
        secViewHeight.constant = 0
        UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
    
    }
    
}


