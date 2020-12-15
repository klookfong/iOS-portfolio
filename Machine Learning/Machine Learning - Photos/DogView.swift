//
//  Dog Classifier.swift
//  Machine Learning - Photos
//
//  Created by Kyle L. on 8/17/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI
import Vision
import CoreML
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI




struct DogView: View {
    @State var image = UIImage()
    @State var wikipediaImage = WebImage(url: URL(string: ""))
    @State var picker = false
    @State var camera = false
    @State var isDog = false
    @State var dogName = ""
    @State var dogDescription = ""
    
    var body: some View {
        VStack {
            HStack{
                VStack {
                    Image(uiImage: self.image).resizable().frame(width: 100, height: 100).clipShape(Circle()).aspectRatio(contentMode: .fit)
                    Text("Image Chosen").foregroundColor(Color.red.opacity(0.80))
                }
                Spacer()
                VStack {
                    self.wikipediaImage.resizable().frame(width: 100, height: 100).aspectRatio(contentMode: .fit).clipShape(Circle())
                    Text("Wikipedia Image").foregroundColor(Color.red.opacity(0.80))
                }
            }.padding()
            Divider()
            HStack {
                Text(self.isDog ? self.dogName.capitalized : "Not a Dog").font(.largeTitle).fontWeight(.light).padding(.horizontal)
                Spacer()
            }
            HStack(alignment: .firstTextBaseline) {
                Text(self.dogDescription).padding()
            }
            Spacer()
            HStack{
                Text("Camera").fontWeight(.ultraLight).padding().foregroundColor(Color.red.opacity(0.80)).onTapGesture {
                    self.camera = true
                    self.picker = true
                    self.image = UIImage()
                    self.wikipediaImage = WebImage(url: URL(string: ""))
                }
                Spacer()
                Text("Camera Roll").fontWeight(.ultraLight).padding().foregroundColor(Color.red.opacity(0.80)).onTapGesture {
                    self.picker = true
                    self.image = UIImage()
                    self.wikipediaImage = WebImage(url: URL(string: ""))
                }
            }
        }.sheet(isPresented: $picker) {
            CaptureView(sourceType: self.camera ? .camera : .photoLibrary) { (i) in
                self.image = i
                self.detect(i)
               
            }
        }
    }
}

extension DogView{
    func detect(_ image: UIImage){
        guard let i = CIImage(image: image) else {fatalError("CANNOT MAKE IMAGE")}
        
        
        guard let model = try? VNCoreMLModel(for: Dog_Classify_1().model) else{fatalError("CANNOT MAKE MODEL")}
        
        let query = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
            if let result = request.results as? [VNClassificationObservation]{
                if let conf = result.first?.confidence, let name = result.first?.identifier {
                    if conf >= 0.45{
                        self.dogName = name
                        self.isDog = true
                        self.search(name)
                    }else{
                        self.isDog = false
                        self.dogDescription = "The Machine believes that you picked a \(name) with \(conf * 100)% confidence"
                    }
                    
                }
            }
        })
        
        let handler = VNImageRequestHandler(ciImage: i)
        
        do {
            try handler.perform([query])
        } catch  {
            fatalError("CANNOT DO REQUEST")
        }
        
    }
}

extension DogView{
    
    func search(_ name: String){
        let wikipediaURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts|pageimages&exintro=&explaintext=&titles=\(name) dog&indexpageids=&redirects=1&pithumbsize=500"
        
        let secondURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts|pageimages&exintro=&explaintext=&titles=\(name) &indexpageids=&redirects=1&pithumbsize=500"
        
        guard let secoded = secondURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else{fatalError("CANNOT ENCODE SECOND URL")}
        
        guard let urltwo = URL(string: secoded) else{fatalError("")}
        
        if let encoded = wikipediaURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
        
        AF.request(url, method: .get).validate().responseJSON { (resp) in
            let json = JSON(resp.value!)
            
            let pageid = json["query"]["pageids"][0].stringValue
            
            print(pageid)
            
            let extract = json["query"]["pages"][pageid]["extract"].stringValue
            
           
            
            let thumbnail = json["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
            
            if !thumbnail.isEmpty{
            self.wikipediaImage = WebImage(url: URL(string: thumbnail))
            self.dogDescription = extract
            }else{
                AF.request(urltwo, method: .get).validate().responseJSON { (response) in
                    let json2 = JSON(response.value!)
                     
                     let pageid2 = json2["query"]["pageids"][0].stringValue
                     
                     print(pageid2)
                     
                     let extract2 = json2["query"]["pages"][pageid2]["extract"].stringValue
                     
                    
                     
                     let thumbnail2 = json2["query"]["pages"][pageid2]["thumbnail"]["source"].stringValue
                    
                    self.wikipediaImage = WebImage(url: URL(string: thumbnail2))
                    self.dogDescription = extract2
                }
            }
        }
      
        print(wikipediaURL)
      
        
    }
    
    }
    
}



