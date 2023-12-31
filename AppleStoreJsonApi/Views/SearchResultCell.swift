//
//  SearchResultCell.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 10/07/2023.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl100)
            logoImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    static let identifier = "SearchResultCell"
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.29M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.layer.cornerRadius = 16
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }
    
    func setupLayout() {
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelsStackView.axis = .vertical
        
        let infoTopStackView = UIStackView(arrangedSubviews: [logoImageView, labelsStackView, getButton])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = UIStackView(arrangedSubviews: [infoTopStackView, screenshotsStackView])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(overallStackView)
        
        overallStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
