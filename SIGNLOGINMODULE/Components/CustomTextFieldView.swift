//
//  CustomTextFieldView.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/26/23.
//

import SwiftUI

struct CustomTextFieldView: View {
    // as this is a child view it is binding, we can do the same with state
    @Binding var textInput: String
    let title: String
    let placeHolderText : String
    var isSecureTextField: Bool = false
    var body: some View {
           // we have a label, textview and a placeholder
        VStack(alignment: .leading, spacing: 5.0) {
            Text(title)
            if isSecureTextField {
                SecureField(placeHolderText, text: $textInput).textFieldStyle(.roundedBorder)
            } else {
                TextField(placeHolderText, text: $textInput).textFieldStyle(.roundedBorder)
            }
        }.padding()
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(textInput: .constant(""), title: "Title", placeHolderText: "Please enter your placeholder text")
    }
}
