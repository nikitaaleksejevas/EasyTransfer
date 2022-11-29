//
//  UsersManager.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import Foundation

class UsersManager {
    
    var users: [User] = []
    
    func register(username: String, password: String, confirmpassword: String){
        
        guard !username.isEmpty, !password.isEmpty else {
            return
        }
        
        guard users.contains(where: { user in username != user.username }) else {
            return
        }
        guard password == confirmpassword else {
            return
        }
    
        
    }
    
}
