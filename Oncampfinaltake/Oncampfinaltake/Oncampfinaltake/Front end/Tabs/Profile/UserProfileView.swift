//
//  UserProfileView.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/22/23.
//

import SwiftUI

struct UserDetailView: View {
    @EnvironmentObject var selectedUserData: UserData
    @State private var isFollowing = false
    @State private var isFavorited = false
    @State private var selectedTab = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding(.top)
                
                Text(selectedUserData.username)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(selectedUserData.status)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(selectedUserData.school)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(selectedUserData.bio)
                    .font(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                HStack {
                    VStack {
                        Text("\(selectedUserData.postCount)")
                            .font(.headline)
                        Text("Posts")
                            .font(.caption)
                    }
                    Spacer()
                    VStack {
                        Text("\(selectedUserData.followerCount)")
                            .font(.headline)
                        Text("Followers")
                            .font(.caption)
                    }
                    Spacer()
                    VStack {
                        Text("\(selectedUserData.followingCount)")
                            .font(.headline)
                        Text("Following")
                            .font(.caption)
                    }
                }.padding(.horizontal)
                
                if isFollowing {
                    HStack {
                        Button(action: {
                            isFollowing.toggle()
                            isFavorited = false // Add code to update following status in backend
                        }) {
                            HStack {
                                Image(systemName: "person.badge.minus")
                                Text("Unfollow")
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                        if isFollowing {
                            Button(action: {
                                isFavorited.toggle()
                                // Add code to update favorite status in backend
                            }) {
                                HStack {
                                    Image(systemName: isFavorited ? "heart.fill" : "heart")
                                    Text(isFavorited ? "Unfavorite" : "Favorite")
                                }
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.top)
                } else {
                    Button(action: {
                        isFollowing.toggle()
                        // Add code to update following status in backend
                    }) {
                        HStack {
                            Image(systemName: "person.badge.plus")
                            Text("Follow")
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)) // Adjust the padding as per your preference
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                     
                    }
                    .padding(.top)
                }
                
                Picker(selection: $selectedTab, label: Text("Posts and Reposts")) {
                    Text("Posts").tag(0)
                    Text("Reposts").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if selectedTab == 0 {
                    // Show Posts
                } else if selectedTab == 1 {
                    // Show Reposts
                }
            }
        }
        .navigationBarTitle("User Profile", displayMode: .inline)
        .onAppear {
            selectedUserData.fetchUserData()
            // Fetch following and favorited status from backend
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView()
                .environmentObject(UserData())
        }
        .previewDevice("iPhone 13")
    }
}
