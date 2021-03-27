//
//  FitQuest_V1App.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI
import Firebase

@main
struct FitQuest_V1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
