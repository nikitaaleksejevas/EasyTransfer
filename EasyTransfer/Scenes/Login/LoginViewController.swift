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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction private func signInTapped(_ sender: Any) {
        
        let homeVC = HomeViewController()
//        homeVC.modalPresentationStyle = .fullScreen
//        present(homeVC, animated: true)
        show(homeVC, sender: self)
    }

    
    @IBAction private func signupTapped(_ sender: Any) {
        
        let registrationVC = RegistrationViewController()
        show(registrationVC, sender: self)
    }
    
    
    
}
