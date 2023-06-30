//
//  MessageListView.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/24.
//

import SwiftUI

struct MessageListView: View {
    
    var messages: [Message] = {
       var messages: [Message] = []
        for i in 1...20 {
            let message = Message(
                id: i,
                imageName: "JackMa",
                nickName: "马云\(i)",
                messageText: "花呗还了吗\(i)",
                messageDate: "上午 6:00"
            )
            messages.append(message)
        }
        return messages
    }()
    
    @State private var isPopoverVisible = false
    @State private var popoverPosition: CGPoint = .zero

    var body: some View {
        NavigationStack {
            List(messages) { message in
                ZStack {
                    NavigationLink {
                        MessageDetailView(title: message.nickName)
                    } label: {
                        EmptyView()
                    }.opacity(0)
                    MessageRowView(message: message)
                }
            }
            .listStyle(.plain)
            .navigationTitle("WeChat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPopoverVisible = true
                    }
                label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.primary)
                    }
                .padding(.horizontal)
                .popover(isPresented: $isPopoverVisible, arrowEdge: .top) {
                    Text("popover")
                        }
                }
            }
        }
        .tabItem {
            Image(systemName: "message")
            Text("Chat")
        }
        // 声明式语法
        // NavigationView本身只是个容器,不渲染页面,由它里面的页面进行UI展示
        // 故要调整NavigationItem里面的东西的话需要给里面的视图增加修饰符,而不是外面的NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
