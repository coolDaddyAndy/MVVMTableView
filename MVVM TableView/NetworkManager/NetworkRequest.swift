//
//  NetworkRequest.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation


final class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(complitionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(EndPoint.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    complitionHandler(.failure(.urlError))
                } else {
                    guard let data else {
                        return
                    }
                    complitionHandler(.success(data))
                }
            }
        }
    }
}
