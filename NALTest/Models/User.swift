//
//  User.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation

final class User {
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
}
