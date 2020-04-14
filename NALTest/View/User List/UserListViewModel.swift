//
//  UserListViewModel.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation

final class UserListViewModel {
    var users: [User] = []

    func numberOfRows() -> Int{
        return users.count
    }

    func viewModelForCellViewModel(at indexPath: IndexPath) -> UserListCellViewModel? {
        guard indexPath.row < users.count else { return nil }
        return UserListCellViewModel(user: users[indexPath.row])
    }
}
