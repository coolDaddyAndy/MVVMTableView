//
//  Observable.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation


final class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
