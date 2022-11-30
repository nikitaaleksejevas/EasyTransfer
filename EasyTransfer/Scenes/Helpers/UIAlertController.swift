//
//  UIAlertController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import Foundation
import UIKit


extension UIAlertController {
    
    static  func showAlert(tittle: String, message: String, controller: UIViewController) {
        
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        controller.present(alert, animated: true)
        
    }
}
