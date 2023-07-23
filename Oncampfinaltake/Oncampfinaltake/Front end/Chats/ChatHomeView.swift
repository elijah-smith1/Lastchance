//
//  ChatHomeView.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/22/23.
//

import SwiftUI

struct ChatHomeView: View {
    @ObservedObject var chatModel = ChatModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    NavigationLink(destination: EmptyView()) {
                        Label("New message", systemImage: "square.and.pencil.circle.fill")}
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                }.padding(.bottom)
                Spacer()
                Spacer()
                Divider()
                VStack {
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 26)], spacing: 26) {
                        ForEach(chatModel.messages.suffix(8)) { message in
                            NavigationLink(destination: MessageCard(message: message)) {
                                ChatBubblePreview(message: message)
                            }
                        }
                    }
                }
            }.navigationTitle("Messages")
                .navigationBarTitleDisplayMode(.inline)
            .padding()
            .cornerRadius(10)
            
        }
    }
    
}
 
struct ChatHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHomeView()
            .background(Color.gray.opacity(0.2))
    }
}
