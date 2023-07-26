//
//  AppsGroupCell.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 24/07/2023.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    static var identifier = "AppsGroupCell"
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalController.view)
        setupLayout()
    }
    
    private func setupLayout() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        let horizontalControllerConstraints = [
            horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(horizontalControllerConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
