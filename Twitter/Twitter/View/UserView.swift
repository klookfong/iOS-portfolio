//
//  UserView.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI

struct UserView: View {
    @State var user: User
    @State var isFollowing = false
    @Binding var show: Bool
    let tweets = [
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
    @State var showNewUser = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: "chevron.backward").padding(10).background(Color.black.opacity(0.1)).clipShape(Circle()).onTapGesture {
                        withAnimation{self.show.toggle()}
                    }
                    Spacer()
                }
                //won't have a header for simplicity's sake
                HStack{
                    self.user.avi.resizable().frame(width: 50, height: 50).clipShape(Circle())
                    Spacer()
                    //can implement in backend, this is only for UI purposes
                    Text(self.isFollowing ? "Un-follow":"Follow").padding(10).background(Color.blue).clipShape(Capsule()).foregroundColor(Color.white).onTapGesture {
                        withAnimation{self.isFollowing.toggle()}
                        if self.isFollowing{
                            user.followers += 1
                        }else{
                            user.followers -= 1
                        }
                    }
                }
                Text(user.name).fontWeight(.bold)
                Text(user.handle).fontWeight(.light).opacity(0.8).padding(.bottom, 5)
                Text(user.bio).padding(.bottom, 5)
                HStack{
                    if user.location != nil{
                        Image(systemName: "mappin").opacity(0.8)
                        Text(user.location!).font(.caption).fontWeight(.light).opacity(0.8)
                    }
                    if user.website != nil{
                        Image(systemName: "laptopcomputer")
                        Link(destination: user.website!, label: {
                            Text("\(user.website!)").font(.caption2)
                        })
                    }
                }.padding(.bottom, 5)
                HStack{
                    Text("\(user.following)")
                    Text("Following").fontWeight(.light).opacity(0.8)
                    Text("\(user.followers)")
                    Text("Followers").fontWeight(.light).opacity(0.8)
                }.padding(.bottom)
                Divider()
                ForEach(tweets){tweet in
                    Tweet(tweetItems: tweet)
                    Divider()
                }
            }.padding()
        }
    }
}


