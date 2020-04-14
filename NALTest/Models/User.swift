//
//  User.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import RealmSwift
import ObjectMapper

final class User: Object, Mappable {

    dynamic var id: Int = 0
    dynamic var avatarUrl: String = ""
    dynamic var login: String = ""
    dynamic var username: String = ""
    dynamic var location: String = ""
    dynamic var bio: String?
    dynamic var url: String = ""
    dynamic var numberOfRepos: Int = 0
    dynamic var numberOfFollowers: Int = 0
    dynamic var numberOfFollowing: Int = 0

    required init() { }

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

    override class func primaryKey() -> String? {
        return "id"
    }
}
