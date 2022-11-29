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
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction private func sendTapped(_ sender: Any) {
        
    }
    
    
    @IBAction private func logoutTapped(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true)
        self.presentingViewController?.dismiss(animated: true)

        
    }
    
}
