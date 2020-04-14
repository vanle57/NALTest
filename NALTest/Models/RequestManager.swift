//
//  RequestManager.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Alamofire
import ObjectMapper

enum Result<T: Any> {
    case success(T)
    case failure(Error)
}

typealias Completion<T> = (Result<T>) -> Void

final class RequestManager {

    static let shared: RequestManager = RequestManager()

    private init() { }

    func getUsers(completion: @escaping Completion<[User]>) {
        guard let url = URL(string: "https://api.github.com/users") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        let request = AF.request(url)
        request.response { (data) in
            switch data.result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(APIError.emptyData))
                    return
                }
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else {
                        completion(.failure(APIError.jsonConvertError))
                        return
                    }
                    let users = Mapper<User>().mapArray(JSONArray: json)
                    RealmManager.shared.saveUsers(users: users, completion: completion)
                } catch {
                    completion(.failure(APIError.jsonConvertError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getUser(id: Int, completion: @escaping Completion<User>) {
        guard let url = URL(string: "https://api.github.com/users/\(id)") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        let request = AF.request(url)
        request.response { (data) in
            switch data.result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(APIError.emptyData))
                    return
                }
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                        let user = Mapper<User>().map(JSON: json)
                    else {
                        completion(.failure(APIError.jsonConvertError))
                        return
                    }
                    completion(.success(user))
                } catch {
                    completion(.failure(APIError.jsonConvertError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

enum APIError: Error {
    case invalidURL
    case jsonConvertError
    case emptyData
    case realm

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "URL is invalid"
        case .jsonConvertError:
            return "Json convert error"
        case .emptyData:
            return "Empty data"
        case .realm:
            return "Something happend to realm"
        }
    }
}
