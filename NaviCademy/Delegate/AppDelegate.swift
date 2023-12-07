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
        FirebaseApp.configure()
        // Additional setup if needed
        return true
    }
}
