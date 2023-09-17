//
//  NetworkDataFetch.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation


final class NetworkDataFetch {
    
    static var shared = NetworkDataFetch()
    
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func fetchUsers(response: @escaping([Users]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let users = try self.decoder.decode([Users].self, from: data)
                    response(users, nil)
                } catch let jsonError {
                    print ("Failed to decode JSON.", jsonError)
                }
            case .failure(_):
                response(nil, .unableToParseData)
            }
        }
    }
}
