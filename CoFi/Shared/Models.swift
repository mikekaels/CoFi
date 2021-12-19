//
//  Models.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//

import Foundation

struct User {
    let first: String
    let second: String
    let email: String
    let appleUserId: String
    let profileImageUrl: String
    let accountNumber: Int
    let bankName: String
    let groupIds: [String]
}

struct Group {
    let groupName: String
    let groupImageUrl: String
    let groupUsersId: [String]
}
