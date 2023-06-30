//
//  MessageRowView.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/26.
//

import SwiftUI

struct MessageRowView: View {
    
    let message: Message
    var body: some View {
        HStack(spacing: 10) {
            Image(message.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6.0) {
                    Text(message.nickName)
                        .font(.system(size: 17))
                    Text(message.messageText)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(message.messageDate)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8.0)
        .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
            return 0
        }
    }
}

//struct MessageRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageRowView(message: Message)
//    }
//}
