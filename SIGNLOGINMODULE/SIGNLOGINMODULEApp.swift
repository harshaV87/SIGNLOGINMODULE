//
//  SIGNLOGINMODULEApp.swift
//  SIGNLOGINMODULE
//
//  Created by Venkata harsha Balla on 6/26/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SIGNLOGINMODULEApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView<AuthViewModel>().environmentObject(AuthViewModel())
        }
    }
}
