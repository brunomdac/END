//
//  HalfWidthInventoryItem.swift
//  END
//
//  Created by Bruno Cunha on 16/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class HalfWidthInventoryItem: UICollectionViewCell {
    
    lazy var imageView = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
    
    
    func setup(blankCell: Bool, itemIndex: Int) {
        
        if blankCell {
            backgroundColor = UIColor.white
            titleLabel.textColor = UIColor.black
            descriptionLabel.textColor = UIColor.black
            titleLabel.textAlignment = .center
            descriptionLabel.textAlignment = .center
            titleLabel.numberOfLines = 0
            descriptionLabel.numberOfLines = 0
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            descriptionLabel.font = descriptionLabel.font.withSize(20)
            titleLabel.text = mockedHalfWidthItemTitles[itemIndex%mockedHalfWidthItemTitles.count].uppercased()
            descriptionLabel.text = mockedHalfWidthItemDescriptions[itemIndex%mockedHalfWidthItemDescriptions.count].uppercased()
            self.addSubview(titleLabel)
            self.addSubview(descriptionLabel)
            
            titleLabel.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-16)
            }
            
            descriptionLabel.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(16).priority(600)
                make.top.greaterThanOrEqualTo(titleLabel.snp.bottom).offset(8).priority(999)
            }
            
        } else {
            imageView.image = UIImage(named: mockedHalfWidthImageNames[itemIndex%mockedHalfWidthImageNames.count])
            imageView.contentMode = .scaleAspectFill
            titleLabel.textColor = UIColor.white
            descriptionLabel.textColor = UIColor.white
            self.addSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
        }
        
        clipsToBounds = true
    }
    
}
