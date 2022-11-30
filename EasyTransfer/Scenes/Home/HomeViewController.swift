//
//  HomeViewController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var sendToUserTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    
    //    var userManager: UserManager!
    var user: User!
    var userManager: UserManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.username)!"
        balanceLabel.text = String(user.balance)
        amountTextField.delegate = self
        sendToUserTextField.delegate = self
        amountTextField.keyboardType = .numberPad
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction private func sendTapped(_ sender: Any) {
        
        guard let amount = Double(amountTextField.text!) else {
            return
        }
        
        
        let result = userManager.transfer(sender: user, sendTo: sendToUserTextField.text! , amount: amount)
        balanceLabel.text = String(user.balance)
        
        if let errorMessage = result.errorMessage {
            UIAlertController.showAlert(tittle: "Transfer Error", message: errorMessage, controller: self)
        }
        
    }
    
    
    @IBAction private func logoutTapped(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true)
        self.presentingViewController?.dismiss(animated: true)
        
        
    }
}

extension HomeViewController: UITextFieldDelegate {
    
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
