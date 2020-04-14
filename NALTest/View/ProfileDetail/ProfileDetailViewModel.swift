//
//  ProfileDetailViewModel.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation

final class ProfileDetailViewModel {
    var user: User = User()

    init(id: Int = 0) {
        user.id = id
    }
}
