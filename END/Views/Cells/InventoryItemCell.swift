//
//  InventoryItemCell.swift
//  END
//
//  Created by Bruno Cunha on 15/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import Foundation
import UIKit

class InventoryItemCell: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    //MARK: Constants
    let cellElementsVerticalOffset = 4
    
    //MARK: Properties
    private lazy var imageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var priceTag = UILabel()
    
    func setup() {
        setupViews()
        setupConstraints()
        
        nameLabel.text = mockedItemNames[Int(arc4random_uniform(numberOfMockedItems))]
        descriptionLabel.text = mockedItemColors[Int(arc4random_uniform(numberOfMockedItems))]
        priceTag.text = mockedPriceTags[Int(arc4random_uniform(numberOfMockedItems))]
        imageView.image = UIImage(named: mockedImages[Int(arc4random_uniform(numberOfMockedItems))])
    }
    
    func setupViews() {
        
        backgroundColor = UIColor.white
        
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(priceTag)
        
        imageView.contentMode = .scaleAspectFit
        nameLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        priceTag.textAlignment = .center
        
        nameLabel.numberOfLines = 0
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(cellElementsVerticalOffset)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(cellElementsVerticalOffset)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        priceTag.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
    
}
