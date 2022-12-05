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
    
    private let userManager = UserManager()
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)] )
        
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)] )
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
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
        
        if let sheet = registrationVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 25
            sheet.largestUndimmedDetentIdentifier = .medium
            
        }
        
        present(registrationVC, animated: true)
    }
}
