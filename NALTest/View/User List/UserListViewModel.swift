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

    func viewModelForProfile(at indexPath: IndexPath) -> ProfileDetailViewModel? {
        guard indexPath.row < users.count else { return nil }
        return ProfileDetailViewModel(id: users[indexPath.row].id)
    }

    func getUsers(completion: @escaping Completion<Bool>) {
        RequestManager.shared.getUsers { [weak self] (result) in
            switch result {
            case .success(let users):
                self?.users = users
                self?.saveUsers(completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func saveUsers(completion: @escaping Completion<Bool>) {
        RealmManager.shared.add(objects: users) { (result) in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchUsers(completion: @escaping Completion<Bool>) {
         if let users = RealmManager.shared.fetchObjects(User.self) {
            self.users = Array(users)
            completion(.success(true))
        } else {
            completion(.failure(APIError.realm))
        }
    }
}
