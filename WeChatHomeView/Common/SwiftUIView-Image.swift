//
//  SwiftUIView-Image.swift
//  WeChatHomeView
//
//  Created by 胡文博 on 2023/06/24.
//

import SwiftUI

struct SwiftUIView_Image: View {
    var body: some View {
        Image("JackMa")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
            .clipped()
    }
}

struct SwiftUIView_Image_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_Image()
    }
}
