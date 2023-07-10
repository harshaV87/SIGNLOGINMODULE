//
//  AuthViewModel.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/28/23.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject, AuthDelegate {
    
    lazy var userAuthenticator = UserAuthenticator(delegate: self)
    @Published var userSessionActive: Bool?
    
    func signIn(withEmail email: String, withPassword password: String) async throws {
       try? await userAuthenticator.authenticate(type: .email(email: email, password: password))
    }
    
    func createUser(withEmail email: String, withPassword: String, fullName: String) async throws {
        
    }
    
    func signOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() {
        
    }
    
    
}


extension AuthViewModel: AuthServiceDelegate {
    
    var userAlreadyLoggedIn: Bool {
        get {
           return false
        }
        set {
            DispatchQueue.main.async { [weak self] in
                self?.userSessionActive = newValue
            }
        }
    }
    
    func authService(_ authService: PreferredAuthMethod, didAuthenticate user: UserInfo) {
        
    }
    
    func authService(_ authService: PreferredAuthMethod, didFailToAuthenticate error: Error?) {
        print("error account")
    }
}

// we need to find a way to initialise a service so we do not need to import firebase everywhere

protocol AuthDelegate: ObservableObject {
    var userSessionActive: Bool? {get set}
    func signIn(withEmail email: String, withPassword: String) async throws
    func createUser(withEmail email: String, withPassword password: String, fullName: String) async throws
    func signOut()
    func deleteAccount()
    func fetchUser()
}



