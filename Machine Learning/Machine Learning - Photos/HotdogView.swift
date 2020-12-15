//
//  ContentView.swift
//  SeeFood SwiftUI
//
//  Created by Kyle L. on 8/10/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI
import CoreML
import Vision

struct HotdogView: View {
    @State var image = UIImage()
    @State var iShowing = false
    @State var cameraIsSourceType = false
    @State var isHotdog: Bool = false
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(isHotdog ? "Hotdog":"Not Hotdog").font(.largeTitle).fontWeight(.light)
                Spacer()
            }.background(isHotdog ? Color.green.opacity(0.20): Color.red.opacity(0.20))
            Image(uiImage: image).resizable().frame(width: 300, height: 300).clipShape(Circle()).overlay(Circle().stroke()).padding()
            Spacer()
            HStack {
                //MARK: - MUST HAVE A CAMERA
                Button(action: {self.iShowing = true
                    self.cameraIsSourceType = true})
                {Image(systemName: "camera")
                    Text("Camera")
                    
                }
                Spacer()
                Button(action: {self.iShowing = true})
                {Image(systemName: "arkit")
                 Text("Photo Library")
                    
                }
                
            }.padding().foregroundColor(Color.red.opacity(0.20))
        }.onAppear {
            self.image = UIImage()
        }.sheet(isPresented: self.$iShowing) {
            CaptureView(sourceType: self.cameraIsSourceType ? .camera : .photoLibrary) {i in
                self.image = i
                self.detect(i)
            }
            
        }
    }
}


extension HotdogView{
    
    func detect(_ queryImage: UIImage){
        guard let i = CIImage(image: queryImage) else{fatalError("CANNOT CONVERT IMAGE")}
        
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else{fatalError("CANNOT MAKE MODEL")}
        
        let hotdogQuery = VNCoreMLRequest(model: model) { (request, error) in
            guard let requests = request.results as? [VNClassificationObservation] else{fatalError("CANNOT MAKE REQUEST")}
            
            if (requests.first?.identifier.contains("hotdog"))!{
                self.isHotdog = true
                print(requests.first?.identifier ?? "cannot unwrap optional")
                print(self.isHotdog)
            }else{
                self.isHotdog = false
                print(requests.first?.identifier ?? "cannot unwrap optional")
                print(self.isHotdog)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: i)
        
        do {
            try  handler.perform([hotdogQuery])
        } catch  {
            fatalError("CANNOT DO MODEL")
        }
        
        
        
        
    }
    
}
