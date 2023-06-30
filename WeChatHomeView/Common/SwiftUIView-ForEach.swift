//
//  SwiftUIView-ForEach.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/25.
//

import SwiftUI

struct SwiftUIView_ForEach: View {
    
    var messages: [Message] = {
       var messages: [Message] = []
        for i in 1...20 {
            let message = Message(
                id: i,
                imageName: "JackMa",
                nickName: "马云\(i)",
                messageText: "花呗换了吗\(i)",
                messageDate: "上午 6:00"
            )
            messages.append(message)
        }
        return messages
    }()
    var arr = [1,2,3,4]
    
    var body: some View {
        
        VStack {
            ForEach(messages, id:\.nickName) { message in
                Text("xxxx\(message.nickName)")
            }
        
//        VStack {
//            ForEach(1..<5) { i in
//                Text("xx\(i)")
//            }
        }
    }
}

struct SwiftUIView_ForEach_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_ForEach()
    }
}
