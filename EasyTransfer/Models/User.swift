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
    //    var transferHistory: [TransferHistory] = [
    //    TransferHistory(senderUsername: "Nikita", receiverUsername: "a", amount: 2124, date: "2022.12.02"),
    //    TransferHistory(senderUsername: "Nikita", receiverUsername: "a", amount: 20224, date: "2022.12.03"),
    //    TransferHistory(senderUsername: "Nikita", receiverUsername: "a", amount: 2224, date: "2022.12.04"),
    //    TransferHistory(senderUsername: "Nikita", receiverUsername: "a", amount: 66224, date: "2022.12.07"),
    //    TransferHistory(senderUsername: "Nikita", receiverUsername: "a", amount: 77777, date: "2022.12.01"),
    //    TransferHistory(senderUsername: "Nikita", receiverUsername: "a", amount: 09224, date: "2022.12.09"),
    //    ]
    
    
    init(username: String, password: String, balance: Double) {
        self.username = username
        self.password = password
        self.balance = balance
    }    
}
