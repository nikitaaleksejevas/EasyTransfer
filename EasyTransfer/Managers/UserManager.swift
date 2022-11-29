//
//  UsersManager.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import Foundation

struct Result {
    let errorMessage: String?
    let user: User?
}

class UserManager {
    
    var users: [User] = [
        User(username: "a", password: "b")
    ]
    
    func register(username: String, password: String, confirmpassword: String) -> Result{
        
        guard !username.isEmpty, !password.isEmpty else {
            return Result(errorMessage: "Username or password is empty.", user: nil)
        }
        
//        guard username.count >= 8 else {
//            return Result(errorMessage: "Username should be at least 8 symbols.", user: nil)
//        }
//        
//        guard password.count >= 8 else {
//            return Result(errorMessage: "Password should be at least 8 symbols.", user: nil)
//        }
        
        for user in users {
            if username == user.username {
                return Result(errorMessage: "Username already exists.", user: nil)
            }
        }
        
        if password != confirmpassword {
            return Result(errorMessage: "Passwords doesn't match.", user: nil)
        }
        
        let user = User(username: username, password: password)
        users.append(user)
        
        return Result(errorMessage: nil, user: user)
    }
    
    func login(username: String, password: String) -> Result {
        
        let currentUser = users.first { user in
            user.username == username
        }
        guard let user = currentUser else {
            return Result(errorMessage: "Incorrect username or password.", user: nil)
        }
        
        if user.password != password {
            return Result(errorMessage: "Incorrect username or password.", user: nil)
        }
        
        return Result(errorMessage: nil, user: user)
    }
}
