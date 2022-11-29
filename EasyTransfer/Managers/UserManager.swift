//
//  UsersManager.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import Foundation

class UserManager {
    
    var users: [User] = []
    
    func register(username: String, password: String, confirmpassword: String){
        
        guard !username.isEmpty, !password.isEmpty else {
            return print("username and password is empty")
        }
        
        for user in users {
            if username == user.username {
                return print("username already exists")
            }
        }
        
        if password != confirmpassword {
            return print("password doesnt match")
        }
        
        let user = User(username: username, password: password)
        users.append(user)
        
    }
    
    func login(username: String, password: String){
        
        for user in users {
            
            if username == user.username && password == user.password {
            }
            print("username or password doesnt match")
        }
        
        
    }
    
    
}
