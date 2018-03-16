//
//  FullWidthInventoryItem.swift
//  END
//
//  Created by Bruno Cunha on 16/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class FullWidthInventoryItem: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    //MARK: Mocked data
    
    let mockedFullWidthItemTitles = [
        "Engineered Garments",
        "Valentino"
    ]
    
    let mockedFullWidthItemDescriptions = [
        "Island meets industry.",
        "The age of VLTN."
    ]
    
    let mockedImageNames: [String] = [
        "mockedImage10",
        "mockedImage11",
        "mockedImage12",
        "mockedImage13"
    ]
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
    
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        imageView.contentMode = .scaleAspectFill
        clipsToBounds = true
        titleLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        titleLabel.textColor = UIColor.white
        descriptionLabel.textColor = UIColor.white
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        descriptionLabel.font = descriptionLabel.font.withSize(20)
        
        titleLabel.text = mockedFullWidthItemTitles[Int(arc4random_uniform(2))].uppercased()
        descriptionLabel.text = mockedFullWidthItemDescriptions[Int(arc4random_uniform(2))].uppercased()
        
        imageView.image = UIImage(named: mockedImageNames[Int(arc4random_uniform(4))])
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(16)
        }
    }
    
    func setup() {
        setupViews()
        setupConstraints()
    }
    
}
