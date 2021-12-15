//
//  FirebaseHelper.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//

import Foundation
import Firebase

enum Response {
    case result(User)
    case empty
}

class FirebaseHelper {
    let db = Firestore.firestore()
    
    static func addUser(first: String, second: String, email: String, appleUserId: String, completion: @escaping(Result<Response, Error>) -> ()) {
        
        getUserWithEmail(email: email) { result in
            switch result {
            case .success(.result(let data)):
                completion(.success(.result(data)))
            
            case .success(.empty):
                var ref: DocumentReference? = nil
                ref = FirebaseHelper().db.collection("users").addDocument(data: [
                    "first": first,
                    "second": second,
                    "email": email,
                    "appleUserId": appleUserId
                ]) { err in
                    if let err = err {
                        completion(.failure(err))
                    } else {
                        getUserWithAppleId(appleId: appleUserId) { result in
                            switch result {
                            case .success(let data):
                                completion(.success(data))
                            case.failure(let err):
                                completion(.failure(err))
                            }
                        }
                    }
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    static func getUserWithAppleId(appleId: String, completion: @escaping(Result<Response, Error>) -> ()) {
        FirebaseHelper().db.collection("users")
            .whereField("appleUserId", isEqualTo: appleId)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    let first = document.data()["first"] as? String ?? ""
                    let second = document.data()["second"] as? String ?? ""
                    let email = document.data()["email"] as? String ?? ""
                    let appleUserId = document.data()["appleUserId"] as? String ?? ""
                    let profileImageUrl = document.data()["profileImageUrl"] as? String ?? ""
                    let accountNumber = document.data()["accountNumber"] as? Int ?? 0
                    let bankName = document.data()["bankName"] as? String ?? ""
                    let groupIds = document.data()["groupIds"] as? [String] ?? [""]
                    
                    let result = User(first: first, second: second, email: email, appleUserId: appleUserId, profileImageUrl: profileImageUrl, accountNumber: accountNumber, bankName: bankName, groupIds: groupIds)
                    
                    completion(.success(.result(result)))
                }
            }
        }
    }
    
    static func getUserWithEmail(email: String, completion: @escaping(Result<Response, Error>) -> ()) {
        FirebaseHelper().db.collection("users")
            .whereField("email", isEqualTo: email)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if querySnapshot!.documents.isEmpty {
                    completion(.success(.empty))
                } else {
                    for document in querySnapshot!.documents {
                        let first = document.data()["first"] as? String ?? ""
                        let second = document.data()["second"] as? String ?? ""
                        let email = document.data()["email"] as? String ?? ""
                        let appleUserId = document.data()["appleUserId"] as? String ?? ""
                        let profileImageUrl = document.data()["profileImageUrl"] as? String ?? ""
                        let accountNumber = document.data()["accountNumber"] as? Int ?? 0
                        let bankName = document.data()["bankName"] as? String ?? ""
                        let groupIds = document.data()["groupIds"] as? [String] ?? [""]
                        
                        let result = User(first: first, second: second, email: email, appleUserId: appleUserId, profileImageUrl: profileImageUrl, accountNumber: accountNumber, bankName: bankName, groupIds: groupIds)
                        
                        completion(.success(.result(result)))
                    }
                }
            }
        }
    }
    
    static func getUser(userEmail: String,completion: @escaping(Result<[User], Error>) -> ()) {
        print("EMAIL: ",userEmail)
        FirebaseHelper().db.collection("users")
            .whereField("email", isEqualTo: userEmail)
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    completion(.failure(err))
                } else {
                    var users: [User] = []
                    for document in querySnapshot!.documents {
                        let first = document.data()["first"] as? String ?? ""
                        let second = document.data()["second"] as? String ?? ""
                        let email = document.data()["email"] as? String ?? ""
                        let appleUserId = document.data()["appleUserId"] as? String ?? ""
                        let profileImageUrl = document.data()["profileImageUrl"] as? String ?? ""
                        let accountNumber = document.data()["accountNumber"] as? Int ?? 0
                        let bankName = document.data()["bankName"] as? String ?? ""
                        let groupIds = document.data()["groupIds"] as? [String] ?? [""]
                        
                        let result = User(first: first, second: second, email: email, appleUserId: appleUserId, profileImageUrl: profileImageUrl, accountNumber: accountNumber, bankName: bankName, groupIds: groupIds)
                        
                        users.append(result)
                    }
                    
                    DispatchQueue.main.async {
                        completion(.success(users))
                    }
                    
                }
            }
    }
}
