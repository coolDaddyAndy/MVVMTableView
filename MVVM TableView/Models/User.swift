//
//  Users.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation

struct User: Decodable {
    let name: String
    let username :String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
}
