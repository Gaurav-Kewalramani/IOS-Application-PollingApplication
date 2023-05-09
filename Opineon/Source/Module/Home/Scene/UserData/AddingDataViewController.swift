//
//  AddingDataViewController.swift
//  Opineon
//

//

import UIKit
import FirebaseAuth

class AddingDataViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var continentTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var religionTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var relationshipTextField: UITextField!
    @IBOutlet weak var headlineTextField: UITextField!
    
    //MARK: - Other Properties
    
    var addViewModel = UserAddViewModel()
   // @Published var text:String?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // dataPass()
    }
//    func dataPass(){
//        print("data:",studyTextField.text!)
////        let values = AppUser(uid:Auth.auth().currentUser?.uid,name:"vansika")
////        print("Value :",values)
////        UserAddViewModel(userInitialData: values)
//    }
    
    //MARK: - IB Action
    
    @IBAction func saveUserData(_ sender: Any) {
        
        let name = (nameTextField.text) ?? nil
        let education = (educationTextField.text) ?? nil
        let continent = (continentTextField.text) ?? nil
        let language = (languageTextField.text) ?? nil
        let occupation = (occupationTextField.text) ?? nil
        let nationality = (nationalityTextField.text) ?? nil
        let religion = (religionTextField.text) ?? nil
        let incomeRange = (incomeTextField.text) ?? nil
        let relationship = (relationshipTextField.text) ?? nil
        let headline = (headlineTextField.text) ?? nil
        let values = AppUser(uid:Auth.auth().currentUser?.uid,
                             name: name,
                             nationality: nationality,
                             education: education,
                             contient: continent,
                             incomeRange: incomeRange,
                             language: language,
                             occupation: occupation,
                             religion: religion,
                             relationship: relationship,
                             headline: headline
                            )
               print("Value :",values)
        addViewModel.addUser(initialdata: values)
    }
}

