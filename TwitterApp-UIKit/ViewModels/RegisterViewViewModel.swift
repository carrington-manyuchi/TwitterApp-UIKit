//
//  RegisterviewViewModel.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/29.

// Basically the View Model is going to handle all the logic for the view itself thats the beauty of MVVM which is basically solving the issue of mass view controller in MVC or having spaghetti code.

// Tsis class is going to inherit or conform to the observable OBJECT Protocol

// Marking a class as final it means we can nolonger inherit from that class

// By conforming to the Observable Object we can hold published variables (publishers) which are are going to notify  the views which we  are going to subscribe for those publishers whenever a new change occurs to them.

// It is ddifficult at first but the proceess is easy.

import UIKit
import Firebase
import Combine

final class RegisterViewViewModel: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    @Published var user: User?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func validateRegistrationForm() {
        
        guard let email = email ,
              let password = password else {
            isRegistrationFormValid = false
            return
        }
        isRegistrationFormValid = isValidEmail(email) && password.count >= 8
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
