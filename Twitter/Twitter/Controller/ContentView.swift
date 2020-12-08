//
//  ContentView.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI

struct ContentView: View {
    @State var exampleTweets = [
        TweetItems(id: 0, poster: User.kyle,
                                     tweet: "I wonder how to make these apps in SwiftUI",
                                     likes: 0, rts: 0, comments: 0, days: 0),
    
        TweetItems(id: 1, poster: User.kyle,
                                     tweet: "I wonder which iOS Development job will hire me with this in my portfolio?",
                                     likes: 0, rts: 0, comments: 0, days: 0),
        TweetItems(id: 2, poster: User.kyle,
                                     tweet: "I <3 going to the University of Texas at Austin",
                                     likes: 0, rts: 0, comments: 0, days: 0),
        TweetItems(id: 3, poster: User.kyle,
                                     tweet: "Give me a reason why storyboards are better than SwiftUI.... I'll wait",
                                     likes: 0, rts: 0, comments: 0, days: 0),
        TweetItems(id: 4, poster: User.kyle,
                                     tweet: "Okay but like, why does this look so good",
                                     likes: 0, rts: 0, comments: 0, days: 0),
        TweetItems(id: 5, poster: User.kyle,
                                     tweet: "If I didn't love app development so much I could be an app designer omg this looks so good.",
                                     likes: 0, rts: 0, comments: 0, days: 0)
    ]
    @State var showNew = false
    @State var showUser = false
    var showingPen = true
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(exampleTweets){tweet in
                        HStack(spacing: 0) {
                            NavigationLink(
                                destination: UserView(user: tweet.poster, show: self.$showUser).navigationBarHidden(true).scaleEffect(x: 1, y: -1, anchor: .center),
                                isActive: self.$showUser,
                                label: {
                                    EmptyView()
                                }).frame(width: 0)
                                .opacity(0)
                            Tweet(tweetItems: tweet).onTapGesture{
                                self.showUser.toggle()
                            }
                        }.scaleEffect(x: 1, y: -1, anchor: .center)
                    }
                }.navigationBarHidden(true)
            }.scaleEffect(x: 1, y: -1, anchor: .center)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "pencil").padding().background(Color.blue).clipShape(Circle()).foregroundColor(Color.white)
                }
            }.padding().onTapGesture{self.showNew.toggle()}
        }.sheet(isPresented: self.$showNew) {
            NewTweet(show: self.$showNew, user: User.kyle ,tweets: self.$exampleTweets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}


