//
//  LoginService.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/29/23.
//

import Foundation
import UIKit
import SwiftUI

// enum for preferred authentication method

enum PreferredAuthMethod {
    // phone auth
    case phone(number: String)
    // email auth like firebase or any other backend
    case email(email: String, password: String)
    // third party auths
    case google
    case facebook
    case apple
    // new cases added here
}

// lets define a protocol

protocol AuthService {
    // property as enum
    var authType: PreferredAuthMethod {get}
    // sign in and sign out
    func authenticate() async throws
    func deauthenticate()
}

// delegate for auth

protocol AuthServiceDelegate: AnyObject {
    var userAuthenticator: UserAuthenticator {get}
    var userAlreadyLoggedIn: Bool { get set}
    // adding methods for auth success and failure
    func authService(_ authService: PreferredAuthMethod, didAuthenticate user: UserInfo)
    func authService(_ authService: PreferredAuthMethod, didFailToAuthenticate error: Error?)
}

// extend auth method

extension PreferredAuthMethod {
    func getService(delegate: AuthServiceDelegate?) -> AuthService{
        switch self {
        case .phone(let number):
            return AppleAuthService(delegate: delegate)
        case .email(let email, let password):
            return FirebaseAuthService(delegate: delegate, email: email, passWord: password)
        case .google:
            return AppleAuthService(delegate: delegate)
        case .facebook:
            return AppleAuthService(delegate: delegate)
        case .apple:
            return AppleAuthService(delegate: delegate)
        }
        
    }
}

// we can create a service for the respective sdks

// For apple

class AppleAuthService : NSObject, AuthService {
    var authType: PreferredAuthMethod = .apple
    
    // init with viewController and serice delegate
    
    var delegate: AuthServiceDelegate?
    // if there is a backend, init here
    
    // Backend Service
    var backendAuth: BackendService?
    
    init(delegate: AuthServiceDelegate?) {
        self.delegate = delegate
        self.backendAuth = fireBaseBackend(service: delegate)
    }
    
    func authenticate() {
        //backendAuth?.authenticateWithFirebase(emailID: "", password: <#String#>)
    }
    
    func deauthenticate() {
       // backendAuth?.deAuthenticateWithFirebase()
    }
    
    
}

// extension for apple auth service

extension AppleAuthService {
    // extensions to be passed here , including protocols
}


class FirebaseAuthService: NSObject, AuthService {
    
    var email: String?
    var passWord: String?
    
   
    
    // init with viewController and serice delegate
    
    var delegate: AuthServiceDelegate?
    // if there is a backend, init here
    
    // Backend Service
    var backendAuth: BackendService?
    
    lazy var authType: PreferredAuthMethod = .email(email: email ?? "", password: passWord ?? "")
    
    init(delegate: AuthServiceDelegate?, email: String?, passWord: String?) {
        self.email = email
        self.passWord = passWord
        self.delegate = delegate
        self.backendAuth = fireBaseBackend(service: delegate)
    }
    
    func authenticate() async throws {
         try? await backendAuth?.authenticateWithFirebase(emailID: email ?? "", password: passWord ?? "")
    }
    
    func deauthenticate() {
        backendAuth?.deAuthenticateWithFirebase()
    }
    
}


//Typealias
typealias AuthenticationViewSource = AuthServiceDelegate

// Mediator

class UserAuthenticator {
    private weak var source: AuthenticationViewSource?
    private var service: AuthService?
    
    init(delegate: AuthenticationViewSource?) {
        self.source = delegate
    }
    
    func authenticate(type: PreferredAuthMethod) async throws{
        service = type.getService(delegate: source)
        try? await service?.authenticate()
    }
    
    func deauthenticate(type: PreferredAuthMethod) {
        service = type.getService(delegate: source)
        service?.deauthenticate()
    }
}

// Abstraction for any service provider here



struct UserInfo {
    var userId: String
    var userEmail: String
}
