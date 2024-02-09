//
//  OnBoardScreensViewController.swift
//  BelocatedTabBar
//
//  Created by Samuel Sajeev on 08/02/24.
//

import UIKit

class OnBoardScreensViewController: UIViewController {
    
    //    outlets
    @IBOutlet weak var OnBoardmageView: UIImageView!
    @IBOutlet weak var MainHeadingLabel: UILabel!
    @IBOutlet weak var subParagraphLabel: UILabel!
    @IBOutlet weak var boldTextParagraph: UILabel!
    @IBOutlet weak var skipBtnOutlet: UIButton!
    @IBOutlet weak var nextBtnOutlet: UIButton!
    @IBOutlet weak var backBtnOutlet: UIButton!
    @IBOutlet weak var skipDashedLabel: UILabel!
    
    // ConstraintsOutlets
    @IBOutlet weak var mainHeadingBottomConstraints: NSLayoutConstraint!
    @IBOutlet var subParagraphBottamConstraints: UIView!
    @IBOutlet weak var subParagHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var getStartBtn: UIButton!
    @IBOutlet weak var backBtnRightSideConstraints: NSLayoutConstraint!
    @IBOutlet weak var lastPageBackBtn: UIButton!
    @IBOutlet weak var subParaWidthConstraints: NSLayoutConstraint! //42
    @IBOutlet weak var subParagraphTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var paraBottamConstraint: NSLayoutConstraint!
    
    // variables
    var onBoardScreenImages = ["onBoardFirst","onBoardSec","onBoardThird","onBoardFive","onBoardSix","onBoardSEven"] // 6 onboard screens
    var imageLocate = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        backBtnOutlet.isHidden = true
        getStartBtn.layer.cornerRadius = 16
        //getStartBtn.addRoundCorner(radius: 17.5, borderWidth: 0, borderColor: UIColor.black)
        getStartBtn.buttonGradient()
        getStartBtn.isHidden = true
        lastPageBackBtn.isHidden = true
        getStartBtn.layer.cornerRadius = getStartBtn.frame.height / 2
//        MainHeadingLabel.font = UIFont(name: "Gilroy-Bold", size: 30)
//        subParagraphLabel.font = UIFont(name: "Gilroy-Regular", size: 17)
        subParagraphLabel.addInterlineSpacing()
        // swipeup gesture
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)

        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
    }
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
            if gesture.direction == .right {
                if imageLocate != 0{
                    backBtnAction(self)
                }
            } else if gesture.direction == .left {
                if imageLocate <= 4{
                    nextBtnAction(self)
                }
            }
        }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        backBtnOutlet.isHidden = false
        if imageLocate <= 4{
            imageLocate += 1
        }
        OnBoardmageView.image = UIImage(named: onBoardScreenImages[imageLocate])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
        displayOnBoards()
        mainHeadingBottomConstraints.constant = 300 // down animation height
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
        mainHeadingBottomConstraints.constant = 233
        
    }
    
    @IBAction func skipBtnAction(_ sender: Any) {
        let toSignInSignUpPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onBoardingViewController") as! onBoardingViewController
        navigationController?.pushViewController(toSignInSignUpPage, animated: true)
        
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        if imageLocate != 0{
            imageLocate -= 1
        }
        if imageLocate == 0{
            backBtnOutlet.isHidden = true
        }
        displayOnBoards()
        OnBoardmageView.image = UIImage(named: onBoardScreenImages[imageLocate])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
        mainHeadingBottomConstraints.constant = 300 // down animation height
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
        mainHeadingBottomConstraints.constant = 233
        
    }
    
    @IBAction func getStartBtnAction(_ sender: Any) {
        //        let toSignInSignUpPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onBoardingViewController") as! onBoardingViewController
        //        navigationController?.pushViewController(toSignInSignUpPage, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let LoginVc = storyBoard.instantiateViewController(withIdentifier: "onBoardingViewController") as! onBoardingViewController
               self.navigationController?.pushViewController(LoginVc, animated: true)
        print("btn pressed")
    }
    
    func displayOnBoards(){
        switch imageLocate{
        case 0:
            MainHeadingLabel.text = "Rescuee"
            MainHeadingLabel.font = UIFont(name: "Gilroy-Bold", size: 30)
            subParagraphLabel.text = "Awesome! Now Let's start adding your loved ones. Your loved ones are called"
            boldTextParagraph.text = "\"Rescuee\""
            boldTextParagraph.isHidden = false
            subParagHeightConstraint.constant = 46
            subParaWidthConstraints.constant = 42
            subParagraphLabel.textAlignment = .left
            subParagraphLabel.addInterlineSpacing()
//            subParagraphTopConstraint.constant = 12
        case 1:
            MainHeadingLabel.text = "Support Cast"
            let mainHeading = "“Support Cast(s)”"
            let subParagraph = "Let’s choose your family and friends to help you protect and rescue your loved ones in an emergency. Your friends and family are called “Support Cast(s)”"
            let attributedStrings = NSMutableAttributedString(string: subParagraph)
            if let range = subParagraph.range(of: mainHeading) {
                let nsRange = NSRange(range, in: subParagraph)
                attributedStrings.addAttribute(.foregroundColor, value: UIColor(red: 70/255, green: 58/255, blue: 8/255, alpha: 1), range: nsRange)
                attributedStrings.addAttribute(.font, value: UIFont(name: "Gilroy-Bold", size: 17)!, range: nsRange)
            }
            subParagraphLabel.attributedText = attributedStrings
            subParagraphLabel.setLineSpacing()
            subParagraphLabel.textAlignment = .left
            boldTextParagraph.isHidden = true
//            subParagHeightConstraint.constant = 110
            subParaWidthConstraints.constant = 30
//            subParagraphTopConstraint.constant = -5
        case 2:
            MainHeadingLabel.text = "Rescuer"
            subParagraphLabel.text = "Rescuer can easily share the location of the Rescuee with the Support Cast/Caregiver"
            subParagraphLabel.textAlignment = .left
            boldTextParagraph.isHidden = true
            subParagHeightConstraint.constant = 90
            subParaWidthConstraints.constant = 42
            subParagraphLabel.addInterlineSpacing()
//            subParagraphTopConstraint.constant = -10
        case 3:
            MainHeadingLabel.text = "Caregiver"
            subParagraphLabel.text = "As a Caregiver you can add Rescuees and connect with one or more Support Casts."
            subParagraphLabel.textAlignment = .justified
            boldTextParagraph.isHidden = true
            subParagHeightConstraint.constant = 90
            subParaWidthConstraints.constant = 42
            subParagraphLabel.addInterlineSpacing()
//            subParagraphTopConstraint.constant = -19
        case 4:
            MainHeadingLabel.text = "Rescue Process"
            subParagraphLabel.text = "Rescuer can get the details that you provided of the Rescuee and inform the Support Cast/Caregiver. Once the Rescuee is located and returned, the rescue process would be completed"
            subParagraphLabel.textAlignment = .left
            boldTextParagraph.isHidden = true
            subParagHeightConstraint.constant = 120
            getStartBtn.isHidden = true
            nextBtnOutlet.isHidden = false
            backBtnOutlet.isHidden = false
            lastPageBackBtn.isHidden = true
            skipDashedLabel.isHidden = false
            skipBtnOutlet.isHidden = false
            subParaWidthConstraints.constant = 45
            subParagraphLabel.addInterlineSpacing()
//            subParagraphTopConstraint.constant = 7
        case 5:
            MainHeadingLabel.text = "BeLocated Store"
            subParagraphLabel.text = "Purchase useful products from the BeLocated store."
            subParagraphLabel.textAlignment = .left
            boldTextParagraph.isHidden = true
            subParagHeightConstraint.constant = 46
            getStartBtn.isHidden = false
            nextBtnOutlet.isHidden = true
            backBtnOutlet.isHidden = true
            lastPageBackBtn.isHidden = false
            skipDashedLabel.isHidden = true
            skipBtnOutlet.isHidden = true
            subParaWidthConstraints.constant = 42
            subParagraphLabel.addInterlineSpacing()
//            subParagraphTopConstraint.constant = 9
        default:
            print("problem in onboard btn action")
        }
    }
    }
    extension UIView{
        func buttonGradient()
        {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor(red: 255/255, green: 205/255, blue: 0/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 232/255, blue: 137/255, alpha: 1).cgColor]
            gradientLayer.cornerRadius = layer.cornerRadius
            gradientLayer.startPoint = CGPoint(x: 0,y:0)
            gradientLayer.endPoint = CGPoint(x:1,y:0)
            gradientLayer.frame = bounds
            layer.insertSublayer(gradientLayer, at: 0)
            gradientLayer.cornerRadius = 25
        }
        
    }
private extension UILabel {

    // MARK: - spacingValue is spacing that you need
    func addInterlineSpacing(spacingValue: CGFloat = 4) {

        // MARK: - Check if there's any text
        guard let textString = text else { return }

        // MARK: - Create "NSMutableAttributedString" with your text
        let attributedString = NSMutableAttributedString(string: textString)

        // MARK: - Create instance of "NSMutableParagraphStyle"
        let paragraphStyle = NSMutableParagraphStyle()

        // MARK: - Actually adding spacing we need to ParagraphStyle
        paragraphStyle.lineSpacing = spacingValue

        // MARK: - Adding ParagraphStyle to your attributed String
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))

        // MARK: - Assign string that you've modified to current attributed Text
        attributedText = attributedString
    }

}
extension UILabel {

    func setLineSpacing(lineSpacing: CGFloat = 4, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))


        // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
}
