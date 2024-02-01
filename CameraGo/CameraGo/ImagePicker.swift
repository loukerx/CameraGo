//
//  ImagePicker.swift
//  CameraGo
//
//  Created by Yin Hua on 1/2/2024.
//

import SwiftUI
import UIKit

// 1. 创建用于在SwiftUI中展示UIImagePickerController的包装器
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isShown: Bool

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        @Binding var isShown: Bool

        init(image: Binding<UIImage?>, isShown: Binding<Bool>) {
            _image = image
            _isShown = isShown
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = uiImage
            isShown = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, isShown: $isShown)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.cameraDevice = .front // 使用前置摄像头
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}
