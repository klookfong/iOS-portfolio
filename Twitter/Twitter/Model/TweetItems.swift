//
//  TweetItems.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI


struct TweetItems: Identifiable{
    var id: Int
    var poster: User
    var tweet: String
    var likes: Int
    var rts: Int
    var comments: Int
    var days: Int
    
    static let ex1 = TweetItems(id: 0, poster: User.kyle,
                                 tweet: "I wonder how to make these apps in SwiftUI",
                                 likes: 0, rts: 0, comments: 0, days: 0)
}
