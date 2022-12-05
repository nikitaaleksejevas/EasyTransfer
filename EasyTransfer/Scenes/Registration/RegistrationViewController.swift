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
    @IBOutlet private weak var errorMessageLabel: UILabel!
    
    var userManager: UserManager!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)] )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)] )
        
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Confirm password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction private func signupTapped(_ sender: Any) {
        
        let result = userManager.register(username: usernameTextField.text!, password: passwordTextField.text!, confirmpassword: confirmPasswordTextField.text!)
        
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
}
