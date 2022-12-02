//
//  User.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-29.
//

import Foundation

///Codable
class User {
    
    let username: String
    let password: String
    var balance: Double
    var transferHistory = [TransferHistory]()

    init(username: String, password: String, balance: Double) {
        self.username = username
        self.password = password
        self.balance = balance
    }
}
