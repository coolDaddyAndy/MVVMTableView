//
//  MainCell.swift
//  MVVM TableView
//
//  Created by Andrei Sushkou on 17.09.23.
//

import UIKit


final class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    private var labelsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLabel.font = .systemFont(ofSize: 16)
        emailLabel.font = .boldSystemFont(ofSize: 14)
        emailLabel.textColor = .gray
        
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel,emailLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
    }
}
