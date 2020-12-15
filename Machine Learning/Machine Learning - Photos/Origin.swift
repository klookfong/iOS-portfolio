//
//  Origin.swift
//  Machine Learning - Photos
//
//  Created by Kyle L. on 8/16/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct Origin: View {
    let viewCollection: [NList] = [
        NList(title: "Hot Dog ML", iname: "zzz", index: 0),
        NList(title: "Flower ML", iname: "leaf.arrow.circlepath", index: 1),
        NList(title: "Dog ML", iname: "house", index: 2),
    ]
    @State var index = 0
    var body: some View {
        NavigationView {
            List(viewCollection, id: \.title){view in
                NavigationLink(destination: ShowingView(index: view.index).navigationBarTitle(view.title)) {
                    HStack {
                        Image(systemName: view.iname)
                        Text(view.title)
                    }
                }
            }.navigationBarTitle("Core ML Previews")
        }.accentColor(Color.red.opacity(0.20))
    }
    
}

//MARK: - Title, Image, and Index

struct NList{
    var title: String
    var iname: String
    var index: Int
}


//MARK: - View Selection

struct ShowingView: View{
    @State var index: Int
    var body: some View{
        Group{
            if index == 0{
                HotdogView()
            }else if index == 1{
                FlowerView()
            }else if index == 2{
                DogView()
            }
        }
    }
}


//MARK: - Preview
struct Origin_Previews: PreviewProvider {
    static var previews: some View {
        Origin()
    }
}
