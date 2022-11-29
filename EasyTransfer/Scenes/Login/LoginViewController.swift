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
            let homeVC = HomeViewController()
            self.show(homeVC, sender: self)
        }
    }

    
    @IBAction private func signupTapped(_ sender: Any) {
        let registrationVC = RegistrationViewController()
        show(registrationVC, sender: self)
    }
}


//        homeVC.modalPresentationStyle = .fullScreen
//        present(homeVC, animated: true)
