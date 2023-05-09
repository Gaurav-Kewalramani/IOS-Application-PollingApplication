//
//  MyTextField.swift
//  Opineon
//
//  Created by Vansika Jain on 22/12/22.
//

import UIKit

class MyTextField: UITextField {
    
    // MARK: - Customizing the one time code textfields
    
    weak var myTextFieldDelegate: MyTextFieldDelegate?
    override func deleteBackward() {
        if text?.isEmpty ?? false {
            myTextFieldDelegate?.textFieldDidEnterBackspace(self)
        }
        super.deleteBackward()
    }
}

protocol MyTextFieldDelegate: AnyObject {
    func textFieldDidEnterBackspace(_ textField: MyTextField)
}



