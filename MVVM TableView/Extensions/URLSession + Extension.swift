//
//  URLSession + Extension.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation


extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(_ endPoint: EndPoint, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endPoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}
