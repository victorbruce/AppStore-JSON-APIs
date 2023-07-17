//
//  ViewController.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 03/07/2023.
//

import UIKit
import SDWebImage

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
        
        fetchITunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunesApps() {
        Service.shared.fetchApps { (results, error) in
            if let error = error {
                print("Failed to fetch apps:", error)
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as? SearchResultCell else { return UICollectionViewCell() }
        
        cell.appResult = appResults[indexPath.item]
        
        return cell
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

