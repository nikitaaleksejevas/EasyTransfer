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
    
    let defaults = UserDefaults.standard

//    var users: [User] = [
//        User(username: "a", password: "b", balance: 5000),
//        User(username: "e", password: "r", balance: 2400)
//    ]

//    var users: [User]{
//        
//        get {
//            if let data = defaults.value(forKey: "users") as? Data{
//                return try! PropertyListDecoder().decode([User].self, from: data)
//            } else {
//                return [User]()
//            }
//        }
//        
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue){
//                defaults.set(data, forKey: "users")
//            }
//        }
//    }
    
    
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
        
        let currentUser = users.first(where: { $0.username == userID })
        guard let user = currentUser else {
            return Result(errorMessage: "Current user doesnt exist!", user: nil, balance: nil)
        }
        
        if amount <= 0 {
            return Result(errorMessage: "You can't transfer negative or zero amount", user: nil, balance: nil)
        }
        
        if sender.balance - amount < 0 {
            //You cannot transfer more than you have
            return Result(errorMessage: "Your balance is not enough.", user: nil, balance: nil)
        }
        
        user.balance += amount
        sender.balance -= amount
        
        return Result(errorMessage: nil, user: nil, balance: user.balance)
    }
}
