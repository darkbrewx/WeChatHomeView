//
//  HomeView.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/27.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            MessageListView()
            Text("Contacts")
                .tabItem {
                    Image(systemName: "person.2.wave.2.fill")
                    Text("Contacts")
                }
            Text("Discover")
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("Discover")
                }
            Text("Me")
                .tabItem {
                    Image(systemName: "person")
                    Text("Me")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
