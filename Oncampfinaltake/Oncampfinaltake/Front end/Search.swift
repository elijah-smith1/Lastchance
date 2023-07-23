//
//  Search.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/22/23.
//

import Foundation
import SwiftUI
struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.gray.opacity(0.3))
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $searchText)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}
