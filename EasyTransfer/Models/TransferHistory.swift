//
//  TransferHistory.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-30.
//

import Foundation

struct TransferHistory {
    
    let senderUsername: String
    let receiverUsername: String
    let amount: String
    let date: String
    
    func getAmount(for user: User) -> String {
        
        if user.username == senderUsername {
            return " - \(amount)"
        } else {
            return " + \(amount)"
        }
    }
    
    func getUser(for user: User) -> String {
        
        if user.username == senderUsername {
            return "Send to: \(receiverUsername)"
        } else {
            return "Received from: \(senderUsername)"
        }
    }
    
}
