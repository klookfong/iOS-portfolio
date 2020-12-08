//
//  User.swift
//  Twitter
//
//  Created by Kyle L. on 12/8/20.
//

import SwiftUI


struct User{
    var name: String
    var handle: String
    var avi: Image
    var bio: String
    var location: String?
    var website: URL?
    var followers: Int
    var following: Int
    static let kyle = User(name: "Kyle", handle: "@klookfong", avi: Image("headshot"), bio: "how you got Twitter but no tweets?", location: "Austin, Texas", website: URL(string: "https://www.klookfong.com"), followers: 0, following: 0)

}
