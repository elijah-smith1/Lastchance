//
//  SelectInterests.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/20/23.
//

import SwiftUI
import Firebase
struct SelectInterests: View {
    var uid: String
    @EnvironmentObject var userData: UserData
    @State private var selectedInterests: Set<String> = []
    @State private var navigate = false // This controls the navigation

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Your other UI elements...

                    ForEach(interests, id: \.self) { interest in
                        Toggle(isOn: Binding(
                            get: { selectedInterests.contains(interest) },
                            set: { isSelected in
                                if isSelected {
                                    selectedInterests.insert(interest)
                                } else {
                                    selectedInterests.remove(interest)
                                }
                            }
                        )) {
                            Text(interest)
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Select Interests")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Save the selected interests to Firestore
                        let documentRef = Firestore.firestore().collection("users").document(uid)
                        documentRef.updateData([
                            "interests": Array(selectedInterests)
                        ]) { err in
                            if let err = err {
                                print("Error updating document: \(err)")
                            } else {
                                print("Document successfully updated")
                                self.navigate = true // Set the state variable to true to trigger navigation
                            }
                        }
                    }) {
                        Text("Save")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
            }
            
            // This NavigationLink will be activated when navigate becomes true
            NavigationLink(destination: Tabview(uid: uid).navigationBarBackButtonHidden(true), isActive: $navigate) {
                EmptyView() // Empty view so the NavigationLink is not visible
            }
        }
    }
}





struct SelectInterests_Previews: PreviewProvider {
    static var previews: some View {
        if let currentUser = Auth.auth().currentUser {
            let uid = currentUser.uid
            return SelectInterests(uid: uid)
                .environmentObject(UserData()) // Add the environment object here
        }

        // Fallback preview for a non-logged-in user
        return SelectInterests(uid: "MjtdfqAyCuhOE8S8MbigBT9okXN2")
            .environmentObject(UserData()) // Add the environment object here
    }
}
