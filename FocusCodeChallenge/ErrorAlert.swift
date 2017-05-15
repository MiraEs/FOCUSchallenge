//
//  ErrorAlert.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/15/17.
//
//
internal enum Status {
    case good, bad
}

import UIKit

class ErrorAlert {
    static let manager = ErrorAlert()
    
    func alert(_ status: Status, title: String, message: String) -> UIAlertController {
        
        switch status {
        case .good:
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            {
                (result : UIAlertAction) -> Void in
                print("succesful upload")
            }
            alertController.addAction(okAction)
            return alertController
            
        case .bad:
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            return alertController

        }
    }
}
