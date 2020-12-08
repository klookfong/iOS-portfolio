//
//  Twitter.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI

struct Twitter: View {
    @State var selection = 0
    var body: some View {
        TabView(selection: self.$selection) {
            ContentView().tabItem { Image(systemName: "house") }.tag(0)
            Text("Search").tabItem { Image(systemName: "safari") }.tag(1)
            Text("Notifications").tabItem { Image(systemName: "iphone.radiowaves.left.and.right") }.tag(2)
            Text("Message").tabItem { Image(systemName: "mail") }.tag(3)
        }.accentColor(Color.blue)
    }
}

struct Twitter_Previews: PreviewProvider {
    static var previews: some View {
        Twitter()
    }
}
