//
//  OncampfinaltakeApp.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/20/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

      
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
struct OncampfinaltakeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
              .environmentObject(UserData())
      }
    }
  }
}
