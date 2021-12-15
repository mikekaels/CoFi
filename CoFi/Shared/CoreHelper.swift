//
//  CoreHelper.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//

import Foundation

class CoreHelper {
    static func saveUser(first: String,
                         second: String,
                         email: String,
                         appleUserId: String,
                         profileImageUrl: String) {
        UserDefaults.standard.set(first, forKey: "first")
        UserDefaults.standard.set(second, forKey: "second")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(appleUserId, forKey: "appleUserId")
        UserDefaults.standard.set(profileImageUrl, forKey: "profileImageUrl")
    }
    
    static func getUser() -> User {
        let id = UserDefaults.standard.string(forKey: "first") ?? ""
        let second = UserDefaults.standard.string(forKey: "second") ?? ""
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let appleUserId = UserDefaults.standard.string(forKey: "appleUserId") ?? ""
        let profileImageUrl = UserDefaults.standard.string(forKey: "profileImageUrl") ?? ""
        
        return User(first: id, second: second, email: email, appleUserId: appleUserId, profileImageUrl: profileImageUrl, accountNumber: 0, bankName: "", groupIds: [""])
    }
}
