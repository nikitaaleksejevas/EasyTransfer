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
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    let usermanager = UserManager()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction  func signInTapped(_ sender: Any) {
        
        let result = usermanager.login(username: usernameTextField.text!, password: passwordTextField.text!)
        
        if let errorMessage = result.errorMessage {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = errorMessage
            
        } else {
            errorMessageLabel.isHidden = true
            user = result.user
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            homeVC.user = user
            present(homeVC, animated: true)
        }
    }

    
    @IBAction private func signupTapped(_ sender: Any) {
        let registrationVC = RegistrationViewController()
        present(registrationVC, animated: true)
    }
}
