//
//  LinkSentViewController.swift
//  BelocatedTabBar
//
//  Created by Samuel Sajeev on 12/02/24.
//

import UIKit


class LinkSentViewController: UIViewController {
    @IBOutlet weak var verificationBtnOutlet: UIButton!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var emailTxtLabel: UILabel!
    @IBOutlet weak var resendDashedLine: UILabel!
    @IBOutlet weak var emailBackgroundView: UIView!
    @IBOutlet weak var emailMobileTextLabelOutlet: UILabel!
    
    // constraints
    @IBOutlet weak var resendLinkLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var dashLineResendLftConstraint: NSLayoutConstraint!//32
    @IBOutlet weak var verificationLeftConstraint: UIView!
    @IBOutlet weak var verificationLftConstrnt: NSLayoutConstraint!//55
    @IBOutlet weak var verificationRightconstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        verificationBtnOutlet.isHidden = true
        doneBtn.layer.cornerRadius = doneBtn.frame.height / 2
        verificationBtnOutlet.layer.cornerRadius = verificationBtnOutlet.frame.height / 2
        backGroundView.clipsToBounds = true
        backGroundView.layer.cornerRadius = 24
        backGroundView.layer.maskedCorners = [.layerMaxXMinYCorner]
        emailTxtLabel.text = readEmailfrmTxtFld
        verificationLftConstrnt.constant = 40
        verificationRightconstraint.constant  = 60
        emailBackgroundView.layer.cornerRadius = emailBackgroundView.frame.height / 2
        if let integerValue = Int(readEmailfrmTxtFld) {
            emailMobileTextLabelOutlet.text = "Click on the link we have sent to your phone number to reset your password"
        } else {
            emailMobileTextLabelOutlet.text = "We have sent you an email with a link to reset your password"
        }
    }

    @IBAction func doneBtnAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
        
        
        
        
    }
    @IBAction func verificationActionBtn(_ sender: Any) {
        verificationBtnOutlet.isHidden = true
        resendBtn.isHidden = false
        resendDashedLine.isHidden = false
        doneBtn.isHidden = false
        verificationLftConstrnt.constant = 40
        verificationRightconstraint.constant  = 60
        resendLinkLeftConstraint.constant = 32
        dashLineResendLftConstraint.constant = 32
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
    }

    
    @IBAction func resendBtn(_ sender: Any) {
        verificationLftConstrnt.constant = 55
        verificationRightconstraint.constant  = 55
        resendLinkLeftConstraint.constant = 45
        dashLineResendLftConstraint.constant = 45
        verificationBtnOutlet.isHidden = false
        resendBtn.isHidden = true
        resendDashedLine.isHidden = true
        doneBtn.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func editbtnAction(_ sender: Any) {
        backGroundView.isHidden = true
        let menu = ForgotPassWrdViewController()
        menu.modalPresentationStyle = .overCurrentContext
        menu.modalTransitionStyle = .coverVertical
        present(menu, animated: false, completion: nil)
        UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
    }
    
}
