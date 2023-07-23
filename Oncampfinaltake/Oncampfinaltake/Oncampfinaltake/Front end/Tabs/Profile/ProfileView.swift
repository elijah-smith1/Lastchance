//  ProfileView.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/21/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import URLImage

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    @State private var selectedTab = 0
      
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                if let url = URL(string: userData.profilePictureURL) {
                    URLImage(url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .clipShape(Circle())
                            .padding(.top)
                    }
                } else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .padding(.top)
                }

                Text(userData.username)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(userData.status)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(userData.school)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(userData.bio)
                    .font(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                if (userData.bio == ""){
                    Text("Please Create a Bio with the edit profile button")
                }

                HStack {
                    VStack {
                        Text("\(userData.postCount)")
                            .font(.headline)
                        Text("Posts")
                            .font(.caption)
                    }
                    Spacer()
                    VStack {
                        Text("\(userData.followerCount)")
                            .font(.headline)
                        Text("Followers")
                            .font(.caption)
                    }
                    Spacer()
                    VStack {
                        Text("\(userData.followingCount)")
                            .font(.headline)
                        Text("Following")
                            .font(.caption)
                    }
                }.padding(.horizontal)
                
                NavigationLink(destination: EmptyView()) {
                    Text("Edit Profile")
                        .font(.callout)
                        .foregroundColor(.primary)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }.padding(.horizontal)
                
                Picker(selection: $selectedTab, label: Text("What is your favorite color?")) {
                    Text("Posts").tag(0)
                    Text("Reposts").tag(1)
                    Text("Likes").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
        .navigationBarTitle("Profile", displayMode: .inline)
        .onAppear {
            userData.fetchUserData()
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
       static var previews: some View {
           ProfileView()
               .environmentObject(UserData()) // Add the environment object here
           
           // Fallback preview for a non-logged-in user
           ProfileView()
               .environmentObject(UserData()) // Add the environment object here
       }
   }
