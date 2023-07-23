//
//  UserDataModel.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/20/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserData: ObservableObject {
    // Instance of Firestore
    private let db = Firestore.firestore()

    @Published var bio: String = ""
    @Published var username: String = ""
    @Published var status: String = ""
    @Published var school: String = ""
    @Published var interests: [String] = [] // Changed from String to [String]
    @Published var profilePictureURL: String = ""
    @Published var followerCount: Int = 0
    @Published var favorites: Int = 0
    @Published var followingCount: Int = 0
    @Published var postCount: Int = 0
    @Published var isVendor: Bool = false // changed from "IsVendor" to "isVendor"
    
    
    func updateUsername(_ newUsername: String) {
           // Your code to fetch user data from database by newUsername
           // For now, just set username to the new one
           self.username = newUsername
       }
    func fetchUserData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let docRef = db.collection("users").document(userId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                self.username = document.data()?["username"] as? String ?? ""
                self.postCount = document.data()?["postCount"] as? Int ?? 0
                self.followerCount = document.data()?["followerCount"] as? Int ?? 0
                self.followingCount = document.data()?["followingCount"] as? Int ?? 0
                self.status = document.data()?["status"] as? String ?? ""
                self.school = document.data()?["school"] as? String ?? ""
                self.bio = document.data()?["bio"] as? String ?? ""
                self.profilePictureURL = document.data()?["profilePictureURL"] as? String ?? ""
                self.isVendor = document.data()?["isVendor"] as? Bool ?? false
                self.interests = document.data()?["interests"] as? [String] ?? []
            } else {
                print("Document does not exist")
            }
        }
    }
    
}

let statuses = ["Online", "Offline", "Do Not Disturb", "Studying", "Geeked", "Partying", "Bored", "In Gym"]
let school = ["Clark Atlanta","Emory","Georgia","Georgia State","Georgia Tech","Kennesaw State","Morehouse", "Morris Brown", "Spelman", "SCAD"]
let interests = ["Staying in", "Going out", "Eating out", "Drinking", "Smoking", "Sports","Reading", "Movies", "Music", "Gaming", "Writing", "Food", "Fashion", "Cars", "Parties"]

