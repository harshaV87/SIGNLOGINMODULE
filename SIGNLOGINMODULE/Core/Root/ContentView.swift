//
//  ContentView.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/26/23.
//

import SwiftUI

struct ContentView<ViewModel: AuthDelegate>: View {
    // we are initialising this from the protocol
    @EnvironmentObject var viewModel: ViewModel
    @State var userNameField : String = ""
    @State var passwordField : String = ""
    var body: some View {
        // view components
        // wrapping in Vstack
        if viewModel.userSessionActive == nil {
            NavigationView {
            VStack {
                // Image
                Image("mainLogo").resizable().scaledToFit().frame(width: 150, height: 150, alignment: .center)
               
                // lets make it a custom one and in vstack
                VStack(alignment: .leading, spacing: 10){
                    // label, textfield, placeholder
                    // label, textfield, placeholder
                    CustomTextFieldView(textInput: $userNameField, title: "Username", placeHolderText: "Enter your username")
                    CustomTextFieldView(textInput: $passwordField, title: "Password", placeHolderText: "Enter your password", isSecureTextField: true)
                }
                Spacer()
                // button signIn
                VStack(alignment: .center, spacing: 10) {
                    CustomButton(textInput: "Sign In", iconName: "") {
                        // button action
                        Task {
                            try? await viewModel.signIn(withEmail: userNameField, withPassword: passwordField) }
                    }
                }
                // button - forgot password
                VStack(alignment: .leading, spacing: 10) {
                    Button {
                    // Forgot password goes here
                    } label: {
                        Text("Forgot Password?")
                    }
                }.frame(alignment: .trailing)
                Spacer()
                // button - signup
                // button or navigation link dont have an account sign up
                    NavigationLink {
                      SignUpView()
                    } label: {
                        HStack(alignment: .center, spacing: 4.0){
                        Text("Dont have an account?")
                            Text("Sign up")}.foregroundColor(Color.blue)
                    }
                Spacer()
            }
        }// Any event that needs to be passed over to the child views 
            .eventHandler { event in
            // reponder chain events triggered here
            print("the event here is handled")
            return nil
        }
        } else {
            // Subsequent usersession value
            ProfileView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView<AuthViewModel>().environmentObject(AuthViewModel())
    }
}
