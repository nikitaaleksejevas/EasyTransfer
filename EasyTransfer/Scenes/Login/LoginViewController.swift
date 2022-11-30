//
//  LoginViewController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-24.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBOutlet private weak var errorMessageLabel: UILabel!
    
    let userManager = UserManager()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction private func signInTapped(_ sender: Any) {
        
        let result = userManager.login(username: usernameTextField.text!, password: passwordTextField.text!)
        
        if let errorMessage = result.errorMessage {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = errorMessage
            
        } else {
            errorMessageLabel.isHidden = true
            user = result.user
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            homeVC.user = user
            homeVC.userManager = userManager
            present(homeVC, animated: true)
        }
    }

    
    @IBAction private func signupTapped(_ sender: Any) {
        let registrationVC = RegistrationViewController()
        registrationVC.userManager = userManager
        present(registrationVC, animated: true)
    }
}
