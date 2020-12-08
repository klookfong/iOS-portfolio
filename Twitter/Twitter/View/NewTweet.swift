//
//  NewTweet.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI

struct NewTweet: View {
    @Binding var show: Bool //make binding
    var user: User
    @State var text = ""
    @Binding var tweets: [TweetItems]
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Cancel").onTapGesture {
                    self.show = false
                }
                Spacer()
                Text("Tweet").padding(10).background(Color.blue).clipShape(Capsule()).foregroundColor(Color.white).onTapGesture {
                    if self.text != ""{
                        let newTweet = TweetItems(id: self.tweets.count, poster: self.user, tweet: self.text, likes: 0, rts: 0, comments: 0, days: 0)
                        self.tweets.append(newTweet)
                        self.show = false
                    }
                }
            }.padding()
            HStack{
                user.avi.resizable().frame(width: 50, height: 50).clipShape(Circle())
                TextField("What's happending", text: self.$text)
                
            }.padding(.horizontal)
            Spacer()
        }
    }
}
