//
//  CaptureView.swift
//  Machine Learning - Photos
//
//  Created by Kyle L. on 8/16/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

public struct CaptureView: UIViewControllerRepresentable {
    private let sourceType: UIImagePickerController.SourceType
    private let onImagePicked: (UIImage) -> Void
    @Environment(\.presentationMode) private var presentationMode
    
    public init(sourceType: UIImagePickerController.SourceType, onImagePicked: @escaping (UIImage) -> Void){
        self.sourceType = sourceType
        self.onImagePicked = onImagePicked
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = self.sourceType
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
      public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(onDismiss: {
            self.presentationMode.wrappedValue.dismiss()
        }, onImagePicked: self.onImagePicked)
    }
    
    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        private let onDismiss: ()-> Void
        private let onImagePicked: (UIImage) -> Void
        
        init(onDismiss: @escaping ()-> Void, onImagePicked: @escaping (UIImage) -> Void ){
            self.onDismiss = onDismiss
            self.onImagePicked = onImagePicked
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage{
                self.onImagePicked(image)
            }
            self.onDismiss()
        }
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.onDismiss()
        }
    }
}
