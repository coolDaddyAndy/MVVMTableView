//
//  MainViewModel.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import Foundation

final class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(value: nil)
    var dataSourse: [User]?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        dataSourse?.count ?? 0
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
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSourse?.compactMap({MainCellViewModel($0)})
    }
}
