//
//  SignUpView.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/26/23.
//

import SwiftUI

struct SignUpView: View {
    // all state variables
    @State var emailInput : String = ""
    @State var userNameInput : String = ""
    @State var passWordInput : String = ""
    @State var conformPassWordInput: String = ""
    // navigationDismiss
    @Environment(\.dismiss) var dismiss
    // responder chain
    @Environment(\.eventClosure) var eventClosure
    var body: some View {
        VStack {
        VStack {
       // 4 text fields - customised
        // email
        CustomTextFieldView(textInput: $emailInput, title: "Email", placeHolderText: "Enter your Email")
        //userName
        CustomTextFieldView(textInput: $userNameInput, title: "Username", placeHolderText: "Enter your username")
        //password
        CustomTextFieldView(textInput: $passWordInput, title: "Password", placeHolderText: "Enter a Password", isSecureTextField: true)
        // confirmPassword
            CustomTextFieldView(textInput: $conformPassWordInput, title: "Confirm Password", placeHolderText: "Conform your password", isSecureTextField: true) }
      // Button to sign up
            CustomButton(textInput: "Sign Up", iconName: "") {
                // button action goes here
            }
        // Button to Sign in - navigate back
            CustomButton(textInput: "Already have an account? Sign In", iconName: "") {
                eventClosure(MyEvent())
                dismiss()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

// responder chain struct
struct MyEvent {
    
}
