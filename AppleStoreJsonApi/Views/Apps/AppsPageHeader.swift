//
//  AppsPageHeader.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 26/07/2023.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    static let identifier = "AppsPageHeader"
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appHeaderHorizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(appHeaderHorizontalController.view)
        
        setupLayout()
    }
    
    private func setupLayout() {
        let appHeaderHorizontalControllerConstraints = [
            appHeaderHorizontalController.view.topAnchor.constraint(equalTo: topAnchor),
            appHeaderHorizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appHeaderHorizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appHeaderHorizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(appHeaderHorizontalControllerConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
