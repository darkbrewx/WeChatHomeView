//
//  ContactsView.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/27.
//

import SwiftUI

struct ContactsView: View {
    let contacts = ["Adam", "Ben", "Charlie", "Daniel", "Ethan", "Frank", "George", "Henry"]
    let initialCharacters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    @State private var currentIndex: Int = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                List {
                    ForEach(initialCharacters, id: \.self) { character in
                        Section(header: sectionHeader(for: character)) {
                            ForEach(filteredContacts(for: character), id: \.self) { contact in
                                Text(contact)
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Contacts")
                .overlay(sectionIndex(geometry: geometry), alignment: .trailing)
            }
        }
    }
    
    func sectionHeader(for character: Character) -> some View {
        Text(String(character))
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func filteredContacts(for character: Character) -> [String] {
        contacts.filter { $0.lowercased().hasPrefix(String(character).lowercased()) }
    }
    
    func scrollToSection(_ index: Int) {
        if let character = initialCharacters[safe: index] {
            withAnimation {
                currentIndex = index
                scrollViewReader.scrollTo(character, anchor: .top)
            }
        }
    }
    
    var scrollViewReader: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(initialCharacters, id: \.self) { character in
                        Text(String(character))
                            .id(character)
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.2))
                            .onTapGesture {
                                withAnimation {
                                    proxy.scrollTo(character, anchor: .top)
                                }
                            }
                    }
                }
            }
        }
    }
    
    func sectionIndex(geometry: GeometryProxy) -> some View {
        VStack(alignment: .trailing, spacing: 0) {
            ForEach(initialCharacters.indices, id: \.self) { index in
                let character = initialCharacters[index]
                Button(action: { scrollToSection(index) }) {
                    Text(String(character))
                        .font(.footnote)
                        .foregroundColor(currentIndex == index ? .accentColor : .primary)
                }
                .frame(width: geometry.size.width, height: geometry.size.height / CGFloat(initialCharacters.count))
            }
        }
        .background(Color(UIColor.systemBackground))
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
        .edgesIgnoringSafeArea(.vertical)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}


struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
