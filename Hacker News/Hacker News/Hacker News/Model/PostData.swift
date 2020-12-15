//
//  PostData.swift
//  Hacker News
//
//  Created by Kyle L. on 7/3/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import Foundation

struct Results: Codable{
    let hits: [Post]
}

struct Post: Codable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
