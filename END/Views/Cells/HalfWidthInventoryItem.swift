//
//  HalfWidthInventoryItem.swift
//  END
//
//  Created by Bruno Cunha on 16/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class HalfWidthInventoryItem: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    //MARK: Mocked data
    let mockedHalfWidthItemTitles = [
        "Vitra",
        "Kappa kontroll",
        "Wood wood",
        "Engineered garments"
    ]
    
    let mockedHalfWidthItemDescriptions = [
        "Shop now",
        "Online now"
    ]
    
    let mockedImageNames: [String] = [
        "halfWidthItem1",
        "halfWidthItem2",
        "halfWidthItem3",
        "halfWidthItem4"
    ]
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
    
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: mockedImageNames[Int(arc4random_uniform(4))])
        
        clipsToBounds = true
        titleLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        titleLabel.textColor = UIColor.white
        descriptionLabel.textColor = UIColor.white
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        descriptionLabel.font = descriptionLabel.font.withSize(20)
        
        titleLabel.text = mockedHalfWidthItemTitles[Int(arc4random_uniform(4))].uppercased()
        descriptionLabel.text = mockedHalfWidthItemDescriptions[Int(arc4random_uniform(2))].uppercased()
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
