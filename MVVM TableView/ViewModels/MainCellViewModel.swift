//
//  MainCellViewModel.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation


final class MainCellViewModel {
    
    var name: String
    var email: String
    
    init(_ user: Users) {
        self.name = user.username
        self.email = user.email
    }
}
