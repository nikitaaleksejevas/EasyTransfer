//
//  SendMoneyViewController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-12-02.
//

import UIKit

class SendMoneyViewController: UIViewController {
    
    
    @IBOutlet weak var sendToTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var user: User!
    var userManager: UserManager!
    private let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendToTextField.delegate = self
        amountTextField.delegate = self
        amountTextField.keyboardType = .numberPad
        
        sendToTextField.attributedPlaceholder = NSAttributedString (
        string: "username",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        amountTextField.attributedPlaceholder = NSAttributedString (
            string: "amount",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func sendTapped(_ sender: Any) {
        
        guard let amount = Double(amountTextField.text!) else {
            return
        }
        
        let result = userManager.transfer(senderUser: user, sendTo: sendToTextField.text!, amount: amount)
//        let userBalance = String(user.balance)
        
        if let errorMessage = result.errorMessage {
            UIAlertController.showAlert(tittle: "Transfer Error", message: errorMessage, controller: self)
        } else {
            
            userManager.addTransferHistory(sender: result.senderUser!, receiver: result.receiverUser!, amount: amount, date: date.getFormattedDate(format: "MMMM d, HH:mm"))
            UIAlertController.showAlert(tittle: "Success!", message: "You've successfully transfered \(amount)", controller: self)
        }
    }
    
    
    
    @IBAction func backTapped(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    

}

extension SendMoneyViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if textField == amountTextField {
            if textField.text != "" || string != "" {
                let res = (textField.text ?? "") + string
                return Double(res) != nil
            }
        }
        return true
    }
}
