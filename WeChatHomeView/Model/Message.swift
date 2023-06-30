//
//  Message.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/25.
//

import Foundation

struct Message: Identifiable{
    let id: Int // UUID
    let imageName: String
    let nickName: String
    let messageText: String
    let messageDate: String
}
