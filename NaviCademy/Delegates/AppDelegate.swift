//
//  AppDelegate.swift
//  NaviCademy
//
//  Created by Thomas Sørensen on 28/11/2023.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        configureFirebase()
        return true
    }
    private func configureFirebase() {
               let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        guard let fileopts = FirebaseOptions(contentsOfFile: filePath!)
        else {
            assertionFailure("Couldn't load config file")
            return
        }
        FirebaseApp.configure(options: fileopts)
        // Additional setup if needed
    }
}
