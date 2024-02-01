//
//  ContentView.swift
//  CameraAI
//
//  Created by Yin Hua on 31/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingImagePicker = false
    @State private var image: UIImage?

    var body: some View {
        VStack {
            Button(action: {
                // 显示ImagePicker
                self.isShowingImagePicker = true
            }) {
                Text("拍照")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            }

            // 如果有图片，展示图片
            if let uiImage = self.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .fullScreenCover(isPresented: $isShowingImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$isShowingImagePicker)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
