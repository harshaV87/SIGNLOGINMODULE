//
//  FirebaseService.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 7/1/23.
//

import Foundation
import Firebase

// Actual Backend concrete flow

class fireBaseBackend: BackendService{
    var service: AuthServiceDelegate?
    var userSession: Bool? {
        willSet {
            print("this property is set")
            service?.userAlreadyLoggedIn = newValue ?? false 
        }
        
        didSet {
            print("this property did set")
           
            
        }
    }
    
     init(service: AuthServiceDelegate?) {
         self.service = service
    }
    
    func authenticateWithFirebase(emailID: String, password: String) async throws{
        print("the email id is \(emailID) and password is \(password)")
        do {
            let result =  try await Auth.auth().createUser(withEmail: emailID, password: password)
            userSession = true
            // property can be set only if it is success
        } catch {
            print("the auth error is \(error.localizedDescription)")
            userSession = false
        }
       // service?.authService(.apple, didAuthenticate: UserInfo(userId: "", userEmail: ""))
    }
    
    func deAuthenticateWithFirebase() {
        service?.authService(.apple, didFailToAuthenticate: nil)
    }
}

protocol BackendService {
    func authenticateWithFirebase(emailID: String, password: String) async throws
    func deAuthenticateWithFirebase()
}

// just as above, we can have a backend service that confirms to the backend service protocol 
