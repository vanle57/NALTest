//
//  ProfileDetailViewModel.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation

final class ProfileDetailViewModel {
    
    var id: Int
    var user: User = User()

    init(id: Int = 0) {
        self.id = id
    }

    func getProfile(completion: @escaping Completion<Bool>) {
        RequestManager.shared.getUser(id: id) { [weak self] (result) in
            switch result {
            case .success(let user):
                self?.user = user
                self?.saveProfile(completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func saveProfile(completion: @escaping Completion<Bool>) {
        RealmManager.shared.add(object: user) { (result) in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchProfile(completion: @escaping Completion<Bool>) {
        if let user = RealmManager.shared.fetchObject(User.self, filter: NSPredicate(format: "login = %@", "\(id)")) {
            self.user = user
            completion(.success(true))
        } else {
            completion(.failure(APIError.realm))
        }
    }
}
