//
//  LoginViewModel.swift
//  iPoke
//
//  Created by Wolfgang Florian Covi on 22/04/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    
        private var auth = Auth.auth()
    
        public func login(email: String, password: String) {
            auth.signIn(withEmail: email, password: password) { authResult, error in
                if error == nil {
                    print("sucesso no login")
                } else {
                    print("Error login, error: \(error?.localizedDescription ?? "")")
                }
            }
        }
    
        public func registerUser(email: String, password: String) {
            auth.createUser(withEmail: email, password: password) { authResult, error in
                if error == nil {
                    print("Cadastrado com sucesso")
                } else {
                    print("Error cadastro, error: \(error?.localizedDescription ?? "")")
                }
            }
        }
}
