//
//  ViewController.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import UIKit

final class MainViewController: UIViewController {

    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Main screen"
        
        view.addSubview(tableView)
        setupTableView()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else {
                return
            }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else {
                return
            }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    func presentDetailViewController(user: User) {
        let detailViewModel = DetailsViewModel(user: user)
        let detailViewController = DetailsViewController(detailViewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
