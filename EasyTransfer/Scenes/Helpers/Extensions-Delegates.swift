//
//  Extensions-Delegates.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-30.
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

extension Date {
    
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension String {
    
    func toCurrencyFormat() -> String {
        if let intValue = Double(self){
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US")
            numberFormatter.numberStyle = NumberFormatter.Style.currency
            return numberFormatter.string(from: NSNumber(value: intValue)) ?? ""
        }
        return ""
    }
}
