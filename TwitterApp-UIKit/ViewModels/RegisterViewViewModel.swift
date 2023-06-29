//
//  RegisterviewViewModel.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/29.
// Basically the View Model is going to handle all the logic for the view itself thats the beauty of MVVM which is basically solving the issue of mass view controller in MVC or having spaghetti code.

// THis class is going to inherit or conform to the observable OBJECT Protocol
// Marking a class as final it means we can nolonger inherit from that class

import UIKit


final class RegisterViewViewModel: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    
    func validateRegistrationForm() {
        
    }
}
