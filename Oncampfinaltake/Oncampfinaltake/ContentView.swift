//
//  AuthView.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/20/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        @EnvironmentObject var userData: UserData
        NavigationStack {
            TabView {
                
                SigninView()
                    .tabItem {
                        Label("Login", systemImage: "person.crop.circle")
                    }
                SignupView()
                    .tabItem {
                        Label("Sign Up", systemImage: "person.crop.circle.badge.plus")
                    }
                
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(UserData()) // Add the environment object here
        }
    }
}
