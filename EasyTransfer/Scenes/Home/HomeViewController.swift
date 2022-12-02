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
    @IBOutlet private weak var transferTableView: UITableView!
    @IBOutlet private weak var balanceView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    
    var user: User!
    var userManager: UserManager!
    private let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.username)!"
        balanceLabel.text = String(user.balance).toCurrencyFormat()
        amountTextField.delegate = self
        sendToUserTextField.delegate = self
        amountTextField.keyboardType = .numberPad
        balanceView.layer.cornerRadius = 30
        dateLabel.text = date.getFormattedDate(format: "MMMM d, yyyy")
        
        transferTableView.layer.cornerRadius = 30
        transferTableView.delegate = self
        transferTableView.dataSource = self
        transferTableView.register(UINib(nibName: "TransferTableViewCell", bundle: nil), forCellReuseIdentifier: "transferCell")
        
        // Do any additional setup after loading the view.
    }
    

//    override func viewDidAppear(_ animated: Bool) {
//        transferTableView.reloadData()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        transferTableView.reloadData()
//
//    }
    
    
    @IBAction private func sendMoneyTapped(_ sender: Any) {
        
        let sendMoneyVC = SendMoneyViewController()
        sendMoneyVC.user = user
        sendMoneyVC.userManager = userManager
        
        present(sendMoneyVC, animated: true)
        
    }
    
    
    @IBAction func reloadData(_ sender: Any) {
        transferTableView.reloadData()
        balanceLabel.text = String(user.balance).toCurrencyFormat()


    }
    
    
    @IBAction private func sendTapped(_ sender: Any) {
        
        guard let amount = Double(amountTextField.text!) else {
            return
        }
        
        let result = userManager.transfer(senderUser: user, sendTo: sendToUserTextField.text! , amount: amount)
//        let userBalance = String(user.balance)
        
        if let errorMessage = result.errorMessage {
            UIAlertController.showAlert(tittle: "Transfer Error", message: errorMessage, controller: self)
        } else {
            
            userManager.addTransferHistory(sender: result.senderUser!, receiver: result.receiverUser!, amount: amount, date: date.getFormattedDate(format: "MMMM d, HH:mm"))
            transferTableView.reloadData()
            UIAlertController.showAlert(tittle: "Success!", message: "You've successfully transfered \(amount)", controller: self)
        }
        
        balanceLabel.text = String(user.balance).toCurrencyFormat()
        
    }
    
    @IBAction private func logoutTapped(_ sender: Any) {
        
        self.dismiss(animated: true)
        self.presentingViewController?.dismiss(animated: true)
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.transferHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transferCell", for: indexPath) as! TransferTableViewCell
        
        cell.amountLabel.text = user.transferHistory[indexPath.row].getAmount(for: user)
        cell.receiverLabel.text = user.transferHistory[indexPath.row].getUser(for: user)
        cell.dateLabel.text = user.transferHistory[indexPath.row].date
        
        return cell
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
