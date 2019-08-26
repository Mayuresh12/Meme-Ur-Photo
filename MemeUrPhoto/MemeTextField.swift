//
//  MemeTextFeild.swift
//  MemeUrPhoto
//
//  Created by Mayuresh Rao on 6/9/19.
//  Copyright © 2019 Mayuresh Rao. All rights reserved.
//

import Foundation
import UIKit

class MemeTextField: NSObject, UITextFieldDelegate {
    func textField(_textfield: UITextField, shouldChangeCharactersInRange: NSRange) -> Bool {
        return true
    }

    //MARK: Text Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true;
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    

}

