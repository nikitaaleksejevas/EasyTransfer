//
//  UsersManager.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import Foundation

struct LoginResult {
    let errorMessage: String?
    let user: User?
}

struct TransferResult {
    let errorMessage: String?
    let senderUser: User?
    let receiverUser: User?
    let balance: Double?
}

class UserManager {
    
    //    let defaults = UserDefaults.standard
    
    var users: [User] = [
        User(username: "a", password: "b", balance: 5000),
        User(username: "e", password: "r", balance: 2400)
    ]
    
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
    
    
    func register(username: String, password: String, confirmpassword: String) -> LoginResult{
        
        guard !username.isEmpty, !password.isEmpty else {
            return LoginResult(errorMessage: "Username or password is empty.", user: nil)
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
                return LoginResult(errorMessage: "Username already exists.", user: nil)
            }
        }
        
        if password != confirmpassword {
            return LoginResult(errorMessage: "Passwords doesn't match.", user: nil)
        }
        
        let user = User(username: username, password: password, balance: 5000)
        users.append(user)
        return LoginResult(errorMessage: nil, user: user )
    }
    
    func login(username: String, password: String) -> LoginResult {
        
        let currentUser = users.first { user in
            user.username == username
        }
        guard let user = currentUser else {
            return LoginResult(errorMessage: "Incorrect username or password.", user: nil)
        }
        
        if user.password != password {
            return LoginResult(errorMessage: "Incorrect username or password.", user: nil)
        }
        
        return LoginResult(errorMessage: nil, user: user)
    }
    
    
    func transfer(senderUser: User, sendTo username: String, amount: Double) -> TransferResult {
        
        let user = users.first(where: { $0.username == username })
        
        guard let receiverUser = user else {
            return TransferResult(errorMessage: "Receiver user doesn't exist!", senderUser: nil, receiverUser: nil, balance: nil)
        }
        
        if amount <= 0 {
            return TransferResult(errorMessage: "You can't transfer negative or zero amount", senderUser: nil, receiverUser: nil, balance: nil)
        }
        
        if senderUser.balance - amount < 0 {
            return TransferResult(errorMessage: "Your balance is not enough.", senderUser: nil, receiverUser: nil, balance: nil)
        }
        
        receiverUser.balance += amount
        senderUser.balance -= amount
        
        return TransferResult(errorMessage: nil, senderUser: senderUser, receiverUser: receiverUser, balance: senderUser.balance)
        
    }
    
    func addTransferHistory(sender: User, receiver: User, amount: String, date: String) {
        
        
        let transfer = TransferHistory(senderUsername: sender.username, receiverUsername: receiver.username, amount: amount, date: date)
        
        sender.transferHistory.append(transfer)
        receiver.transferHistory.append(transfer)
        
    }
    
}
