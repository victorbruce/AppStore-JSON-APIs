//
//  BaseListController.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 24/07/2023.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
