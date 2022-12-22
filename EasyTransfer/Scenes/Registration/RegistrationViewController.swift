//
//  RegistrationViewController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var errorMessageLabel: UILabel!
    
    var userManager: UserManager!
    var user: User!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        usernameTextField.setPlaceHolder("Username")
        passwordTextField.setPlaceHolder("Password")
        confirmPasswordTextField.setPlaceHolder("Confirm password")
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Actions
    
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

    //MARK: - Extensions

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
