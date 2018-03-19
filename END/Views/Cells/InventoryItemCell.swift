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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        nameLabel.text = ""
        descriptionLabel.text = ""
        priceTag.text = ""
    }
    
    func setup(itemIndex: Int) {
        setupViews()
        setupConstraints()
        
        nameLabel.text = mockedItemNames[itemIndex % mockedItemNames.count]
        descriptionLabel.text = mockedItemColors[itemIndex % mockedItemColors.count]
        priceTag.text = mockedPriceTags[itemIndex % mockedPriceTags.count]
        imageView.image = UIImage(named: mockedImages[itemIndex % mockedImages.count])
        
        nameLabel.font = nameLabel.font.withSize(13)
        descriptionLabel.font = nameLabel.font.withSize(13)
        priceTag.font = nameLabel.font.withSize(13)
        
        descriptionLabel.textColor = .gray

    }
    
    func setupViews() {
        
        backgroundColor = UIColor.white
        
        if !subviews.contains(imageView) {
            self.addSubview(imageView)
        }
        
        if !subviews.contains(nameLabel) {
            self.addSubview(nameLabel)
        }
        
        if !subviews.contains(descriptionLabel) {
            self.addSubview(descriptionLabel)
        }
        
        if !subviews.contains(priceTag) {
            self.addSubview(priceTag)
        }
        
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
            make.top.equalTo(imageView.snp.bottom)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom)
            make.height.lessThanOrEqualToSuperview().multipliedBy(0.1)
        }
        
        priceTag.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
    
}
