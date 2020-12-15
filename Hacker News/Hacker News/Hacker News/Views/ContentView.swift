//
//  ContentView.swift
//  Hacker News
//
//  Created by Kyle L. on 7/3/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.post) { post in
                HStack{
                    NavigationLink(destination: DetailView(url: post.url)) {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }.navigationBarTitle("Hacker News")
        }.onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


