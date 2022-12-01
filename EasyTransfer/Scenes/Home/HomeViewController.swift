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
    @IBOutlet weak var transferTableView: UITableView!
    
    var user: User!
    var userManager: UserManager!
    var transferManager: TransferManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.username)!"
        balanceLabel.text = String(user.balance)
        amountTextField.delegate = self
        sendToUserTextField.delegate = self
        amountTextField.keyboardType = .numberPad
        
        transferTableView.layer.cornerRadius = 10
        transferTableView.delegate = self
        transferTableView.dataSource = self
        transferTableView.register(UINib(nibName: "TransferTableViewCell", bundle: nil), forCellReuseIdentifier: "transferCell")
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func sendTapped(_ sender: Any) {
        
        guard let amount = Double(amountTextField.text!) else {
            return
        }
        
        let result = userManager.transfer(sender: user, sendTo: sendToUserTextField.text! , amount: amount)
        
        if let errorMessage = result.errorMessage {
            UIAlertController.showAlert(tittle: "Transfer Error", message: errorMessage, controller: self)
        }
        else {
            
            userManager.addTransfer(sender: user, receiver: sendToUserTextField.text!, amount: String(amount), date: "2022.10.22")
            transferTableView.reloadData()
            UIAlertController.showAlert(tittle: "Success!", message: "You've successfully transfered \(amount)", controller: self)
        }
        
        balanceLabel.text = String(user.balance)
        
        
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userManager.transferHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transferCell", for: indexPath) as! TransferTableViewCell
        
        
        let currentUser = userManager.transferHistory.first { user in
            self.user.username == user.sender
        }
        
        if user.username == currentUser?.sender {
            cell.receiverLabel.text = "Send to: \(userManager.transferHistory[indexPath.row].receiver)"
            cell.amountLabel.text = "-\(userManager.transferHistory[indexPath.row].amount)"
            cell.dateLabel.text = userManager.transferHistory[indexPath.row].date
        } else {
            
        }

        return cell
    }
}
