//
//  MainViewModel.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var dataSourse: [Users]?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        10
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else {
                return
            }
            self.isLoading.value = false
            if let users {
                self.dataSourse = users
            }
        }
    }
}
