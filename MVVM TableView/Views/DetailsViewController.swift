//
//  DetailsViewController.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 18.09.23.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    
    private lazy var labelStackVIews = UIStackView()
    
    let detailViewModel: DetailsViewModel
    
    init(detailViewModel: DetailsViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        displayUserInfo()
    }
    
    private func setupViews() {
        title = "User details"
        view.backgroundColor = .white
        
        labelStackVIews = UIStackView(arrangedSubviews: [nameLabel,
                                                        usernameLabel,
                                                        emailLabel,
                                                        phoneLabel,
                                                        streetLabel,
                                                        suiteLabel,
                                                        cityLabel])
        labelStackVIews.axis = .vertical
        labelStackVIews.spacing = 2
        labelStackVIews.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelStackVIews)
    }
    
    private func displayUserInfo() {
        nameLabel.text = detailViewModel.name
        usernameLabel.text = detailViewModel.username
        emailLabel.text = detailViewModel.email
        phoneLabel.text = detailViewModel.phone
        streetLabel.text = detailViewModel.street
        suiteLabel.text = detailViewModel.suite
        cityLabel.text = detailViewModel.city
    }
}

//MARK: - Set Constraints

extension DetailsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelStackVIews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelStackVIews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
