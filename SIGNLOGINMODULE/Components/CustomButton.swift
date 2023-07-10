//
//  CustomButton.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/27/23.
//

import SwiftUI

struct CustomButton: View {
    var textInput: String = ""
    var iconName: String = ""
    var buttonAction: (() -> Void)
    var body: some View {
       // we need a text and an icon label and an action
        Button {
            buttonAction()
        } label: {
            Text(textInput).foregroundColor(Color.white).frame(width: UIScreen.main.bounds.width - 15, height: 50)
            Image(iconName)
        }.background(Color.blue).cornerRadius(10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonAction: {
        })
    }
}
