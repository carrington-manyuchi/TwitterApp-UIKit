//
//  AuthenticationViewViewModel.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/30.
//

import UIKit
import Firebase
import Combine

final class AuthenticationViewViewModel: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    @Published var isAuthenticationFormValid: Bool = false
    @Published var user: User?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func validateAuthenticationForm() {
        
        guard let email = email ,
              let password = password else {
            isAuthenticationFormValid = false
            return
        }
        isAuthenticationFormValid = isValidEmail(email) && password.count >= 8
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let email = email,
              let password = password else {
            return
        }
                
        AuthManager.shared.registerUser(with: email, password: password)
            .sink { _ in
                
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subscriptions)

    }
    
}
