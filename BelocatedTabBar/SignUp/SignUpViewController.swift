//
//  SignUpViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 30/08/23.
//

import UIKit
var storeDate = String()
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
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var datePickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var datePickerCancelBtn: UIButton!
//    collectionViewOutletsAndDatePicker
    @IBOutlet weak var yearCollectionView: UICollectionView!
    @IBOutlet weak var monthsColctnView: UICollectionView!
    @IBOutlet weak var dayCollectionView: UICollectionView!
    @IBOutlet weak var doneDatePckrBtnOutlet: UIButton!
    var selectedYearIndex: IndexPath?
    var year = ["2024","2023","2022","2021","2020","2019","2018"]
    var month = ["jan","feb","mar","apr","may","jun","jul","aug"]
    var day = ["1","2","3","4","5","6","7","8","9","10",
               "11","12","13","14","15","16","17","18","19","20",
               "21","22","23","24","25","26","27","28","29","30"]
    var strDay = String()
    var strMnt = String()
    var strYrs = String()
    var strDate = String()
    
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
        datePickerHeightConstraint.constant = 0
        doneDatePckrBtnOutlet.makeRounded()
    }
    
    @IBAction func datePickrCancelBtnAction(_ sender: Any) {
        datePickerHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
        signUpTableview.reloadData()
        
    }
    @IBAction func doneDatePckrBtnAction(_ sender: Any) {
        datePickerHeightConstraint.constant = 0
        if strYrs != ""&&strMnt != ""&&strDay != ""{
            storeDate = "\(strMnt) / \(strDay) / \(strYrs)"
        }
        
        yearCollectionView.reloadData()
        dayCollectionView.reloadData()
        monthsColctnView.reloadData()
        signUpTableview.reloadData()
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
            personaldetailcell.datePickerBtnOutlet.addTarget(self, action: #selector(OpenDatePckrView), for: .touchUpInside)
            personaldetailcell.dateTextFld.text = storeDate
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
    @objc func OpenDatePckrView(){
        datePickerHeightConstraint.constant = 448
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

// datePicker collectionView
extension SignUpViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch collectionView{
        case self.yearCollectionView:
            return year.count
        case self.monthsColctnView:
            return month.count
        case self.dayCollectionView:
            return day.count
        default:
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.yearCollectionView{
            
            let cell = yearCollectionView.dequeueReusableCell(withReuseIdentifier: "yearCell", for: indexPath)as! yearCell
            cell.yearLabelOutlet.text = year[indexPath.row]
            cell.yearCellView.layer.borderWidth = 1
            cell.yearCellView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
            cell.yearCellView.layer.cornerRadius = cell.yearCellView.frame.height / 2
            cell.yearCellView.layer.shadowOpacity = 0
            cell.yearLabelOutlet.textColor = UIColor(red: 99/255, green: 101/255, blue: 105/255, alpha: 1)
            cell.yearLabelOutlet.font = UIFont.systemFont(ofSize: 17)
            return cell
        }
        if collectionView == self.monthsColctnView{
            
            let cellMonth = monthsColctnView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath)as! monthCell
            cellMonth.monthLabel.text = month[indexPath.row]
            cellMonth.monthView.layer.borderWidth = 1
            cellMonth.monthView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
            cellMonth.monthView.layer.cornerRadius = cellMonth.monthView.frame.height / 2
            cellMonth.monthView.layer.shadowOpacity = 0
            cellMonth.monthLabel.textColor = UIColor(red: 99/255, green: 101/255, blue: 105/255, alpha: 1)
            cellMonth.monthLabel.font = UIFont.systemFont(ofSize: 17)
            return cellMonth
            
        }
        if collectionView == self.dayCollectionView{
            
            let cellDay = dayCollectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath)as! dayCell
            cellDay.dayLabel.text = day[indexPath.row]
            cellDay.dayView.layer.borderWidth = 1
            cellDay.dayView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
            cellDay.dayView.layer.cornerRadius = cellDay.dayView.frame.height / 2
            cellDay.dayView.layer.shadowOpacity = 0
            cellDay.dayLabel.textColor = UIColor(red: 99/255, green: 101/255, blue: 105/255, alpha: 1)
            cellDay.dayLabel.font = UIFont.systemFont(ofSize: 17)
            
            return cellDay
            
        }
        
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.yearCollectionView{
            if let previousSelectedIndex = selectedYearIndex,
               let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndex) as? yearCell {
                previousSelectedCell.yearCellView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
                previousSelectedCell.yearCellView.layer.shadowOpacity = 0
                previousSelectedCell.yearLabelOutlet.textColor = UIColor(red: 99/255, green: 101/255, blue: 105/255, alpha: 1)
                previousSelectedCell.yearLabelOutlet.font = UIFont.systemFont(ofSize: 17)
                
            }
            
            if let cell = collectionView.cellForItem(at: indexPath) as? yearCell {
                cell.yearCellView.layer.borderColor = UIColor(red: 255/255, green: 205/255, blue: 0/255, alpha: 1).cgColor

                        cell.yearCellView.layer.shadowColor = UIColor.yellow.cgColor
                        cell.yearCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
                        cell.yearCellView.layer.shadowOpacity = 1
                        cell.yearCellView.layer.shadowRadius = 2
                        cell.yearLabelOutlet.textColor = UIColor.black
                        cell.yearLabelOutlet.font = UIFont.boldSystemFont(ofSize: 17)

                selectedYearIndex = indexPath
                strYrs = cell.yearLabelOutlet.text!
                
            }
        }
        if collectionView == self.monthsColctnView{
            if let previousSelectedIndex = selectedYearIndex,
               let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndex) as? monthCell {
                previousSelectedCell.monthView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
                previousSelectedCell.monthView.layer.shadowOpacity = 0
                previousSelectedCell.monthLabel.textColor = UIColor(red: 99/255, green: 101/255, blue: 105/255, alpha: 1)
                previousSelectedCell.monthLabel.font = UIFont.systemFont(ofSize: 17)
            }
            
            if let cellMonth = collectionView.cellForItem(at: indexPath) as? monthCell {
                cellMonth.monthView.layer.borderColor = UIColor(red: 255/255, green: 205/255, blue: 0/255, alpha: 1).cgColor
                cellMonth.monthView.layer.shadowColor = UIColor.yellow.cgColor
                cellMonth.monthView.layer.shadowOffset = CGSize(width: 0, height: 2)
                cellMonth.monthView.layer.shadowOpacity = 1
                cellMonth.monthView.layer.shadowRadius = 2
                cellMonth.monthLabel.textColor = UIColor.black
                cellMonth.monthLabel.font = UIFont.boldSystemFont(ofSize: 17)
                selectedYearIndex = indexPath
//                strMnt = cellMonth.monthLabel.text!
                strMnt = String((indexPath.row)+1)
                
            }
        }
        if collectionView == self.dayCollectionView{
            if let previousSelectedIndex = selectedYearIndex,
               let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndex) as? dayCell {
                previousSelectedCell.dayView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
                previousSelectedCell.dayView.layer.shadowOpacity = 0
                previousSelectedCell.dayLabel.textColor = UIColor(red: 99/255, green: 101/255, blue: 105/255, alpha: 1)
                previousSelectedCell.dayLabel.font = UIFont.systemFont(ofSize: 17)
            }
            
            if let cellDay = collectionView.cellForItem(at: indexPath) as? dayCell {
                cellDay.dayView.layer.borderColor = UIColor(red: 255/255, green: 205/255, blue: 0/255, alpha: 1).cgColor
                cellDay.dayView.layer.shadowColor = UIColor.yellow.cgColor
                cellDay.dayView.layer.shadowOffset = CGSize(width: 0, height: 2)
                cellDay.dayView.layer.shadowOpacity = 1
                cellDay.dayView.layer.shadowRadius = 2
                cellDay.dayLabel.textColor = UIColor.black
                cellDay.dayLabel.font = UIFont.boldSystemFont(ofSize: 17)
                selectedYearIndex = indexPath
                strDay = cellDay.dayLabel.text!
                
            }
        }
        
        
    }
}
