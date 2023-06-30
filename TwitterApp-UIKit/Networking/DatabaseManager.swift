//
//  DatabaseManager.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/30.
//

import Foundation
import Firebase
import Combine
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift


class DatabaseManager {
    static let shared = DatabaseManager()
    let db = Firestore.firestore()
    let usersPath: String = "users"
    
    func collectionUsers(add user: User) -> AnyPublisher<Bool, Error> {
        
        let twitterUser = TwitterUser(from: user)
        return db.collection(usersPath).document(twitterUser.id).setData(from: twitterUser)
            .map { _ in return true }
            .eraseToAnyPublisher()
    }
    
    func collectionUsers(retrieve id: String) -> AnyPublisher<TwitterUser, Error> {
        db.collection(usersPath).document(id).getDocument()
            .tryMap { try $0.data(as: TwitterUser.self) }
            .eraseToAnyPublisher()
    }
}
