//
//  UserListCellViewModel.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation

final class UserListCellViewModel {
    var avatarUrl: String
    var username: String
    var url: String

    init(user: User = User()) {
        avatarUrl = user.avatarUrl
        username = user.username
        url = user.url
    }
}
