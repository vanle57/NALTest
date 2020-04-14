//
//  RealmManager.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import RealmSwift

final class RealmManager {

    static let shared: RealmManager = RealmManager()

    private init() { }

    func saveUsers(users: [User], completion: @escaping Completion<[User]>) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(User.self, value: users, update: .all)
            }
            completion(.success(users))
        } catch {
            completion(.failure(APIError.realm))
        }
    }

    func fetchUsers(completion: @escaping Completion<[User]>) {
        do {
            let realm = try Realm()
            let users = realm.objects(User.self)
            completion(.success(Array(users)))
        } catch {
            completion(.failure(APIError.realm))
        }
    }
}
