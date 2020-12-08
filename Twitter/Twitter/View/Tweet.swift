//
//  Tweet.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI

struct Tweet: View {
    var tweetItems: TweetItems
    var body: some View {
        VStack {
            
            HStack(alignment: .top) {
                tweetItems.poster.avi.resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fill).clipShape(Circle())
                VStack(alignment: .leading) {
                    HStack {
                        Text(tweetItems.poster.name).fontWeight(.bold)
                        Text(tweetItems.poster.handle).fontWeight(.light).opacity(0.8).padding(.horizontal, -2)
                        Text("• \(tweetItems.days)d").fontWeight(.light).opacity(0.8)
                        Spacer()
                    }
                    Text(tweetItems.tweet)
                    HStack{
                        actionButtons(likes: tweetItems.likes, comments: tweetItems.comments, retweets: tweetItems.rts)
                    }
                    
                }
            }.padding()
            
        }
        
    }
    
    
}


struct actionButtons: View{
    @State var likes: Int
    var comments: Int
    var retweets: Int
    @State var willLike = false
    var body: some View{
        HStack{
            Image(systemName: "bubble.left")
            Text("\(comments)").fontWeight(.light)
            Spacer()
            Image(systemName: "return")
            Text("\(retweets)").fontWeight(.light)
            Spacer()
            Image(systemName: self.willLike ? "heart.fill": "heart").foregroundColor(self.willLike ? .red : .none).onTapGesture {
                //ideally it will post the addition in the backend
                //this is only a UI demonstration
                withAnimation{self.willLike.toggle()}
                if self.willLike{
                    self.likes += 1
                }else{
                    self.likes -= 1
                }
            }
            Text("\(likes)").fontWeight(.light)
            Spacer()
        }.opacity(0.6).padding(.top, 5)
    }
}

