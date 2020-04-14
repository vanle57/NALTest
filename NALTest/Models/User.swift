//
//  User.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation
import ObjectMapper

final class User: Mappable {

    var id: Int = 0
    var avatarUrl: String = ""
    var login: String = ""
    var username: String = ""
    var location: String = ""
    var bio: String?
    var url: String = ""
    var numberOfRepos: Int = 0
    var numberOfFollowers: Int = 0
    var numberOfFollowing: Int = 0

    init() { }

    init?(map: Map) { }

    func mapping(map: Map) {
        id <- map["id"]
        avatarUrl <- map["avatar_url"]
        login <- map["login"]
        username <- map["name"]
        location <- map["location"]
        bio <- map["bio"]
        url <- map["html_url"]
        numberOfRepos <- map["public_repos"]
        numberOfFollowers <- map["followers"]
        numberOfFollowing <- map["following"]
    }
}
