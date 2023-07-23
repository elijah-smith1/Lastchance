import SwiftUI
import Firebase

struct SocialView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var chatModel = ChatModel()
    @State private var searchText = ""
    @State private var usernames: [String] = []
    @State private var searchResults = [String]()
    @ObservedObject var evemtmodel = EventModel()
    
   // var filteredsearch: []
    var body: some View {
        
            NavigationStack {
                
                VStack(spacing: 16) {
                    // Search barrr
                    // List of search results
                    if !searchResults.isEmpty {
                            List(searchResults, id: \.self) { username in
                                NavigationLink(destination: UserDetailView()) {
                                    Text(username)
                                }
                            }
                        }
                    VStack {
                        HStack {
                            Text("Messages")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 16)], spacing: 16) {
                            ForEach(chatModel.messages.suffix(2)) { message in
                                ChatBubblePreview(message: message)
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    
                    Spacer()
                        .frame(height: 10)
                    VStack{
                        HStack{
                            Text("Events")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                
                            Spacer()
                        }
                        ScrollView{
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16)], spacing: 16) {
                                ForEach(evemtmodel.events.suffix(9)) { events in
                                    EventBubblePreview(event: events)
                                }
                            }}
                    }
                    
                    .padding()
                    .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)

                    
                    
                    Spacer()
                }  .searchable(text: $searchText, placement: .automatic, prompt: ("Search"))
                        .onChange(of: searchText) { _ in
                            filterUsernames()
                        }
                .padding(.horizontal)
                .background(Color.white)
                .edgesIgnoringSafeArea(.bottom)
                }.toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: ChatHomeView()) {
                            Label("Notifications", systemImage: "message.fill")}
                    }
                }
                .task {
                            usernames = await fetchUsernames()
                    filterUsernames()
                        }
                .navigationTitle( "Social")
                .navigationBarTitleDisplayMode( .inline)
            }
             // Fetch usernames when the view appears
     
    

    func fetchUsernames() async -> [String] {
        return await withCheckedContinuation { continuation in
            let db = Firestore.firestore()
            db.collection("users").getDocuments { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    continuation.resume(returning: [])
                    return
                }

                let usernames = documents.compactMap { $0["username"] as? String }
                continuation.resume(returning: usernames)
            }
        }
    }
    func filterUsernames() {
        if searchText.isEmpty {
            searchResults = usernames
        } else {
            searchResults = usernames.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

}

struct Social_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
        
    }
}

struct EventSquare: View {
    let index: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hue: Double(index) / 100, saturation: 0.8, brightness: 0.9))
        }
    }
}
struct EventBubblePreview: View {
    var event: Events
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
                    Text(event.title)
                        .padding(8)
                    Text(event.content)
                }
                
                Spacer()
            }
            .padding(10)
        }
        .frame(height: 155)
    }
}


