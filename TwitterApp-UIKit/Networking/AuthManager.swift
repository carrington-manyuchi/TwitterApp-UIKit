//
//  AuthManager.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/30.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine



class AuthManager {
    static let shared = AuthManager()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
        return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}
