//
//  UserDefaults.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-30.
//

import Foundation


//extension UserManager {
//    
//    var users: [User]{
//        
//        get {
//            if let data = defaults.value(forKey: "users") as? Data{
//                return try! PropertyListDecoder().decode([User].self, from: data)
//            } else {
//                return [User]()
//            }
//        }
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue){
//                defaults.set(data, forKey: "users")
//            }
//        }
//    }
//}
