//
//  ContentView.swift
//  Flower Classifier
//
//  Created by Kyle L. on 8/14/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI


struct FlowerView: View {
    @State var isCamera = false
    @State var image = UIImage()
    @State var isShowningImagePicker = false
    @State var flowerName = "Flower Name"
    @State var wikipediaImage = WebImage(url: URL(string: ""))
    @State var description = "Flower Description"
    @State var isFlower = false
    var body: some View {
        VStack {
            HStack{
                VStack {
                    Image(uiImage: self.image).resizable().frame(width: 100, height: 100).clipShape(Circle())
                    Text("Image Chosen").foregroundColor(Color.red.opacity(0.80))
                }
                Spacer()
                VStack {
                    self.wikipediaImage.resizable().frame(width: 100, height: 100).clipShape(Circle())
                    Text("Wikipedia Image").foregroundColor(Color.red.opacity(0.80))
                }
            }.padding()
            Divider()
            HStack {
                Text(self.flowerName.capitalized).font(.largeTitle).fontWeight(.light).padding(.horizontal)
                Spacer()
            }
            HStack(alignment: .firstTextBaseline) {
                Text(self.description).padding()
            }
            Spacer()
            HStack{
                Text("Camera").fontWeight(.ultraLight).padding().foregroundColor(Color.red.opacity(0.80)).onTapGesture {
                    self.isCamera = true
                    self.isShowningImagePicker = true
                    self.image = UIImage()
                    self.wikipediaImage = WebImage(url: URL(string: ""))
                }
                Spacer()
                Text("Camera Roll").fontWeight(.ultraLight).padding().foregroundColor(Color.red.opacity(0.80)).onTapGesture {
                    self.isShowningImagePicker = true
                    self.image = UIImage()
                    self.wikipediaImage = WebImage(url: URL(string: ""))
                }
            }
        }.sheet(isPresented: $isShowningImagePicker) {
            CaptureView(sourceType: self.isCamera ? .camera : .photoLibrary) { (i) in
                self.image = i
                self.learn(i)
                if self.isFlower{
                    self.search(self.flowerName)}
            }
        }
    }
}

//MARK: - Machine Learning

extension FlowerView{
    func learn(_ queryImage: UIImage){
        guard let i = CIImage(image: queryImage) else{fatalError("CANNOT CONVERT IMAGE")}
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else{fatalError("CANNOT CREATE MODEl")}
        
        let flowerQuery = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
            if let flower = request.results as? [VNClassificationObservation]{
                if let name = flower.first, let conf = flower.first?.confidence{
                    if name.confidence >= 0.5{
                        self.flowerName = name.identifier
                        self.isFlower = true
                    }else{
                        self.flowerName = "Did not Select Flower"
                        self.description = "The Machine believes that you picked a \(name) with \(conf * 100)% confidence"

                    }}
            }
        })
        
        let handler = VNImageRequestHandler(ciImage: i)
        
        do {
            try
                handler.perform([flowerQuery])
        } catch  {
            fatalError("CANNOT DO SEARCH")
        }
        
    }
}


//MARK: - Wikipedia Search

extension FlowerView{
    
    func search(_ name: String){
        let wikipediaURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts|pageimages&exintro=&explaintext=&titles=\(name)&indexpageids=&redirects=1&pithumbsize=500"
        
        if let encoded = wikipediaURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
        
        AF.request(url, method: .get).validate().responseJSON { (resp) in
            let json = JSON(resp.value!)
            
            let pageid = json["query"]["pageids"][0].stringValue
            
            print(pageid)
            
            let extract = json["query"]["pages"][pageid]["extract"].stringValue
            
            self.description = extract
            
            let thumbnail = json["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
            
            self.wikipediaImage = WebImage(url: URL(string: thumbnail))
            
            
        }
      
        print(wikipediaURL)
      
        
    }
    
    }
    
}



