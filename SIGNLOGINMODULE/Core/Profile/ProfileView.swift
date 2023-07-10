//
//  ProfileView.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/27/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        // making a list here
        List {
            Section {
               // name with initials
                // full name
                // email
                HStack {
                    Text("VB").font(.title).fontWeight(.semibold).foregroundColor(.white).frame(width: 60, height: 60).background(Color.gray).clipShape(Circle())
                    VStack {
                        Text("VenkataHarsha Balla").fontWeight(.semibold).padding(.top, 9)
                        Text("harsha.b001@gmail.com").font(.footnote).accentColor(.gray)
                    }
                }
            }
            // general section
            Section("General") {
                // custom section
                CustomSectionComponent(imageName: "gear", textName: "version", versionNumber: "1.0.9", tintColor: Color(.systemGray))
            }
            // account section
            Section ("Account"){
                VStack {
                    // here we have a button stack
                    // sign out
                    Button {
                        //sign user out
                    } label: {
                        CustomSectionComponent(imageName: "gear", textName: "Sign Out", versionNumber: "", tintColor: Color(.systemBlue))
                    }
                    // Delete account
                    Button {
                        // delete account
                    } label : {
                        CustomSectionComponent(imageName: "gear", textName: "Delete Account", versionNumber: "", tintColor: Color(.systemCyan))
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
