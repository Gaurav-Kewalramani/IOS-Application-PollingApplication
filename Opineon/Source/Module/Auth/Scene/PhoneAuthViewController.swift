//
//  PhoneAuthViewController.swift
//  Opineon
//
//  Created by Rohit Kumar on 15/11/22.

import UIKit
import CountryPickerView

class PhoneAuthViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var linkTextView: UITextView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var showdowViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // MARK: - Other Properties
    
    var passPhoneNumberLabel = ""
    var passAuthId = ""
    let countryPicker = CountryPickerView()              // creating countryPicker object
    var viewModelObject =  AuthenticationViewModel()    // creating viewModel object
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()               // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! OneTimeCodeViewController
        viewController.editPhoneNumberLabel = passPhoneNumberLabel
        viewController.providerId  = passAuthId
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier != "OneTimeCode" else {
            return false
        }
        return true
    }
    
    // MARK: - IB Action
    
    @IBAction func sendOneTimeCodeButton(_ sender: Any) {
        self.passPhoneNumberLabel = countryCodeLabel.text! + "-" + phoneNumberTextField.text!
        let mobileNumber = countryCodeLabel.text! + phoneNumberTextField.text!
        viewModelObject.authenticateNumber(withPhoneNumnber: mobileNumber) { [weak self] (providerId, error) in
            guard let authId = providerId else {
                print(error?.localizedDescription ?? "error")
                return
            }
            print("authId: " + authId)
            self?.passAuthId = authId
            UserDefaults.standard.set(authId, forKey: "authVerificationID")
            self?.gotoOneTimeCodeScreen()
            
        }
    }
    
    @IBAction func didTapOnCountryPicker(_ sender: Any) {
        countryPicker.showCountriesList(from: self)
    }
}
        
    // MARK: - Country Picker Datasource And Delegate

extension PhoneAuthViewController : CountryPickerViewDelegate, CountryPickerViewDataSource {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        flagImage.image = country.flag
        countryCodeLabel.text = country.phoneCode
    }
}

    // MARK: - Udating Text View With Tappable Links

extension PhoneAuthViewController {
    func updateTermAndCondtionView(){
        let path1 = "https://google.com"
        let path2 = "https://youtube.com"
        let text = linkTextView.text!
        let attributedString = NSAttributedString.makeHyperlink(for: path1, for: path2, in: text, as: "terms and conditions", as: "privacy policy")
        linkTextView.attributedText = attributedString
        linkTextView.font = UIFont(name: "Economica", size: 12)
        linkTextView.textColor = UIColor(named: "TextColor")
        linkTextView.tintColor = UIColor(named: "LinkColor")
    }
}

extension PhoneAuthViewController{
    
    //MARK: - Configure the UI
    
    func configureUI(){
        countryPicker.delegate = self
        countryPicker.dataSource = self
        updateTermAndCondtionView()
        addKeyboardListner()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Redirect to one time code screen
    
    func gotoOneTimeCodeScreen(){
        performSegue(withIdentifier: "OneTimeCode", sender: self)
    }
}
    
    // MARK: - Text Field Delegate

extension PhoneAuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
    
    // MARK: - Keyboard Observer

extension PhoneAuthViewController {
    func addKeyboardListner() {
        NotificationCenter.default.addObserver(self, selector: #selector(didAppearKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didDisappearKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func didAppearKeyboard(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        UIView.animate(withDuration: 1) { [weak self] in
            self?.showdowViewBottomConstraint.constant = keyboardFrame.cgRectValue.size.height
            self?.view.layoutIfNeeded()
        }
    }
    
    @objc func didDisappearKeyboard(notification: NSNotification) {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.showdowViewBottomConstraint.constant = 0
            self?.view.layoutIfNeeded()
        }
    }
    
    // MARK: - To dismiss the keyboard by clicking anywhere on the screen for all View Controllers
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
