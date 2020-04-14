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

    func getProfile(completion: @escaping Completion<Bool>) {
        RequestManager.shared.getUser(id: user.id) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.user = user
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
