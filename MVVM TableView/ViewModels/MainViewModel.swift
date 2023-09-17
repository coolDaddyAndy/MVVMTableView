//
//  MainViewModel.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation

class MainViewModel {
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        10
    }
    
    func getUsers() {
        NetworkDataFetch.shared.fetchUsers { users, error in
            if error != nil {
                print ("Let user know about.")
            } else if let users {
                print (users.count)
            }
        }
    }
}
