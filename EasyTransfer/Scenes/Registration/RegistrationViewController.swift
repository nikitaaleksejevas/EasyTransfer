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
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction private func signupTapped(_ sender: Any) {
        

        let homeVC = HomeViewController()
//        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
        
    }
    
    

}
