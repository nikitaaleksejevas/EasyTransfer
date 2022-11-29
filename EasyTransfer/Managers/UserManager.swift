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
    let balance: Double?
}

class UserManager {
    
    var users: [User] = [
        User(username: "a", password: "b", balance: 5000),
        User(username: "e", password: "r", balance: 2400)
    ]
    
    func register(username: String, password: String, confirmpassword: String) -> Result{
        
        guard !username.isEmpty, !password.isEmpty else {
            return Result(errorMessage: "Username or password is empty.", user: nil, balance: nil)
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
                return Result(errorMessage: "Username already exists.", user: nil, balance: nil)
            }
        }
        
        if password != confirmpassword {
            return Result(errorMessage: "Passwords doesn't match.", user: nil, balance: nil)
        }
        
        let user = User(username: username, password: password, balance: 5000)
        
        
        users.append(user)
        
        return Result(errorMessage: nil, user: user, balance: nil)
    }
    
    func login(username: String, password: String) -> Result {
        
        let currentUser = users.first { user in
            user.username == username
        }
        guard let user = currentUser else {
            return Result(errorMessage: "Incorrect username or password.", user: nil, balance: nil)
        }
        
        if user.password != password {
            return Result(errorMessage: "Incorrect username or password.", user: nil, balance: nil)
        }
        
        return Result(errorMessage: nil, user: user, balance: nil)
    }
    
    
    
    
    func transfer(sender: User, sendTo userID: String, amount: Double) -> Result {

        guard sender.balance >= 0 else {
            return Result(errorMessage: "Your balance bellow zero.", user: nil, balance: nil)
        }
        
        
        let currentUser = users.first(where: { $0.username == userID })
        guard let user = currentUser else {
            return Result(errorMessage: "Current user doesnt exist!", user: nil, balance: nil)
        }
        
        user.balance += amount
        sender.balance -= amount
        return Result(errorMessage: nil, user: nil, balance: user.balance)
    }
}
