//
//  LoginViewViewModel.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/30.
//

import UIKit
import Firebase
import Combine


final class LoginViewViewModel: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    @Published var isLoginFormValid: Bool = false
    @Published var user: User?
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func validateLoginForm() {
        
        guard let email = email ,
              let password = password else {
            isLoginFormValid = false
            return
        }
        isLoginFormValid = isValidEmail(email) && password.count >= 8
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func loginUser() {
        guard let email = email,
              let password = password else {
            return
        }
                
        AuthManager.shared.loginUser(with: email, password: password)
            .sink { [weak self] completion in
                
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
                
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subscriptions)

    }
    
}

