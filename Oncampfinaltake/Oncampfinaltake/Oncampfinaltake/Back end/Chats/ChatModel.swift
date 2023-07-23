//
//  ChatModel.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/22/23.
//

import SwiftUI
import Combine
struct Message: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var sender: String
    var timestamp: Date
    var recipients: [String] = [] 
}


class ChatModel: ObservableObject {
    @Published var messages: [Message] = [
       Message(title: "First Message", content: "Hello, how are you?", sender: "John Doe", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Jane Smith", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "AUCS", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Dubois Chat", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "John Doe", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Jane Smith", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "AUCS", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Dubois Chat", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "John Doe", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Jane Smith", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "AUCS", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Dubois Chat", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "John Doe", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Jane Smith", timestamp: Date()),
       Message(title: "First Message", content: "Hello, how are you?", sender: "AUCS", timestamp: Date()),
       Message(title: "Second Message", content: "Let's meet up tomorrow.", sender: "Dubois Chat", timestamp: Date()),
   ]
}

struct MessageCard: View {
    let message: Message
    
    var body: some View {
        VStack {
            Text(message.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(message.content)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            Text("Sent by \(message.sender)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}
struct ChatBubblePreview: View {
    var message: Message
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 3, x: 0, y: 2)
            
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text(message.sender)
                    Spacer()
                    Text(message.content)
                }
                Divider()
                
                Spacer()
            }
            .padding(10)
        }
        .frame(height: 60)
    }
}
