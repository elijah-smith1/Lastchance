//
//  EventsModel.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/22/23.
//

import SwiftUI
import Foundation
import URLImage
import Combine
struct Events: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var author: String
    var timestamp: Date
    var likeCount: Int
    var repostCount: Int
    var commentCount: Int
    var imageName: String
}
class EventModel: ObservableObject {
    @Published var events: [Events] = [
        Events(title: "Party this Week.", content: " Biggest Backyard Bash in all of Atlanta", author: "Party Throwers", timestamp: Date(), likeCount: 694, repostCount: 0, commentCount: 33, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Atlanta Fair ", content: "this weekend Come on out tickets only $30", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Concert this week", content: "Pull up to my first concert woooo", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Party this Week.", content: " Biggest Backyard Bash in all of Atlanta", author: "Party Throwers", timestamp: Date(), likeCount: 694, repostCount: 0, commentCount: 33, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Atlanta Fair ", content: "this weekend Come on out tickets only $30", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Concert this week", content: "Pull up to my first concert woooo", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Party this Week.", content: " Biggest Backyard Bash in all of Atlanta", author: "Party Throwers", timestamp: Date(), likeCount: 694, repostCount: 0, commentCount: 33, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Atlanta Fair ", content: "this weekend Come on out tickets only $30", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80"),
        Events(title: "Concert this week", content: "Pull up to my first concert woooo", author: "Atl Fair", timestamp: Date(), likeCount: 801, repostCount: 0, commentCount: 0, imageName: "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80")
    ]
}
    struct EventCard: View {
        let event: Events
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(event.content)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                Spacer()
                
                URLImage(URL(string: event.imageName)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .cornerRadius(10)
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                    Text("\(event.likeCount)")
                    
                    Image(systemName: "arrowshape.turn.up.left")
                        .foregroundColor(.green)
                    Text("\(event.repostCount)")
                    
                    Image(systemName: "message")
                        .foregroundColor(.blue)
                    Text("\(event.commentCount)")
                    
                    Spacer()
                    
                    Text("Posted by \(event.author) on \(event.timestamp)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(15)
        }
    }

