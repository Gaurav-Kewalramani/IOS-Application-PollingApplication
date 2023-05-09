//
//  OneTimeCodeViewController.swift
//  Opineon
//
//  Created by Aniket Kumar on 01/12/22.
//

import UIKit
import FirebaseAuth

class OneTimeCodeViewController: UIViewController {
    
    // MARK: - IB Outlet

    
    @IBOutlet weak var linkTextView: UITextView!
    @IBOutlet weak var updatedPhoneNumberLabel: UILabel!
    @IBOutlet weak var shadowViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var oneTimeCodeTextFields: [MyTextField]!
    
    
    // MARK: - Other Properties
    
    var editPhoneNumberLabel = ""
    var text = ""
    var providerId = ""
    var authenticationViewModel =   AuthenticationViewModel() // creating viewModel object
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI() // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier != "EditNumber" && identifier != "Home" else {
            return false
        }
        return true
    }
    
    // MARK: - IB Action
    
    @IBAction func didTapOnMeButton(_ sender: Any) {
        
    }
    
    @IBAction func phoneNumberEditButton(_ sender: Any) {
        performSegue(withIdentifier: "EditNumber", sender: self)
    }
    
    @IBAction func oneTimeCodeValidationButton(_ sender: Any) {
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        let oneTimeCode = oneTimeCodeTextFields.compactMap { $0.text }.joined()
        self.authenticationViewModel.signIn(withProviderId: verificationID!, oneTimeCode: oneTimeCode){(user, error) in
            guard let firebaseUser = user else{
                print("ERROR:   " + (error?.localizedDescription ?? "Error found"))
                return
            }
            print(firebaseUser)
            self.gotoHomeScreen()
        }
    }
}

    // MARK: - Text Field Delegate

extension OneTimeCodeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

extension OneTimeCodeViewController: MyTextFieldDelegate{
    
    // MARK: - One time code textfield switching
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = string
        let nextTextFieldTag = textField.tag+1
        if nextTextFieldTag < oneTimeCodeTextFields.count {
            self.oneTimeCodeTextFields[nextTextFieldTag].becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    func textFieldDidEnterBackspace(_ textField: MyTextField) {
        guard let index = oneTimeCodeTextFields.firstIndex(of: textField) else {
            return
        }
        if index > 0 {
            oneTimeCodeTextFields[index - 1].becomeFirstResponder()
        }
        else {
            view.endEditing(true)
        }
    }
}

extension OneTimeCodeViewController {
    
    //MARK: - Configure the UI
    
    func configureUI() {
        updateTermAndCondtionView()
        updatedPhoneNumberLabel.text = editPhoneNumberLabel
        addKeyboardListner()
        hideKeyboardWhenTappedAround()
        oneTimeCodeTextFields.forEach {$0.myTextFieldDelegate = self }
    }
    
    //MARK: - redirect to home screen
    
    func gotoHomeScreen() {
        performSegue(withIdentifier: "Home", sender: self)
    }

    // MARK: - Updating Text View With Tappable Links 
    
    func updateTermAndCondtionView() {
        let path1 = "https://google.com"
        let path2 = "https://youtube.com"
        let text = linkTextView.text!
        let attributedString = NSAttributedString.makeHyperlink(for: path1, for: path2, in: text, as: "terms and conditions", as: "privacy policy")
        linkTextView.attributedText = attributedString
        linkTextView.font = UIFont(name: "Economica", size: 12)
        linkTextView.textColor = UIColor(named: "TextColor")
        linkTextView.tintColor = UIColor(named: "LinkColor")
    }
    
    // MARK: - Keyboard Observer
    
    @objc func didAppearKeyboard(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        UIView.animate(withDuration: 1) { [weak self] in
            self?.shadowViewBottomConstraint.constant = keyboardFrame.cgRectValue.size.height
            self?.view.layoutIfNeeded()
        }
    }
    
    @objc func didDisappearKeyboard(notification: NSNotification) {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.shadowViewBottomConstraint.constant = 0
            self?.view.layoutIfNeeded()
        }
    }
        
    // MARK: - Utility
    
    func addKeyboardListner() {
        NotificationCenter.default.addObserver(self, selector: #selector(didAppearKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didDisappearKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
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

