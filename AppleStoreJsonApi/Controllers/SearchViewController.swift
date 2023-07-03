//
//  ViewController.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 03/07/2023.
//

import UIKit

class SearchViewController: UICollectionViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

