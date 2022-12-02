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
    let amount: Double
    let date: String
    
    func getAmount(for user: User) -> String {
        
        if user.username == senderUsername {

            return "-" + "\(amount)".toCurrencyFormat()
        } else {
            return "+" +  "\(amount)".toCurrencyFormat()
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
