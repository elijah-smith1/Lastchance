//
//  Tabview.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/21/23.
//

import SwiftUI
import FirebaseAuth

struct Tabview: View {
    var uid: String
    @EnvironmentObject var userData: UserData
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
                        // Tab 1
                        HomeView()
                            .tabItem {
                                Text("Home")
                                Image(systemName: "house.fill")
                            }.tag(0)
                        
                        // Tab 2
                        VendorView()
                            .tabItem {
                                Text("Vendors")
                                Image(systemName: "cart.fill")
                            }.tag(1)
                        
                        // Tab 3
                        Text("Create Post")
                            .tabItem {
                                Text("Create Post")
                                Image(systemName: "plus.square.fill")
                            }.tag(2)
                        
                        // Tab 4
                        SocialView()
                            .tabItem {
                                Text("Social")
                                Image(systemName: "message.fill")
                            }.tag(3)
                        
                        // Tab 5
                        ProfileView()
                            .tabItem {
                                Text("Profile")
                                Image(systemName: "person.fill")
                            }.tag(4)
                    
                        }
    }
}

struct Tabview_Previews: PreviewProvider {
    static var previews: some View {
        if let currentUser = Auth.auth().currentUser {
            let uid = currentUser.uid
            return Tabview(uid: uid)
                .environmentObject(UserData()) // Add the environment object here
        }

        // Fallback preview for a non-logged-in user
        return Tabview(uid: "mMWfp3l2hMUBEhZr4cEMHlswJ1x2")
            .environmentObject(UserData()) // Add the environment object here
    }
}
