//
//  RegistrationViewController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction private func signupTapped(_ sender: Any) {
        
        let result = userManager.register(username: usernameTextField.text!, password: passwordTextField.text!, confirmpassword: confirmPasswordTextField.text!)
        
        if let errorMessage = result.errorMessage {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = errorMessage
        } else {
            errorMessageLabel.isHidden = true
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true)
        }
    }
}
