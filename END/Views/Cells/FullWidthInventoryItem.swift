//
//  FullWidthInventoryItem.swift
//  END
//
//  Created by Bruno Cunha on 16/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class FullWidthInventoryItem: UICollectionViewCell {
    
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
    
    func setup(sectionIndex: Int) {
        if !self.subviews.contains(imageView) {
            self.addSubview(imageView)
        }
        if !self.subviews.contains(titleLabel) {
            self.addSubview(titleLabel)
        }
        if !self.subviews.contains(descriptionLabel) {
            self.addSubview(descriptionLabel)
        }
        
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
        
        titleLabel.text = mockedFullWidthItemTitles[sectionIndex%mockedFullWidthItemTitles.count].uppercased()
        descriptionLabel.text = mockedFullWidthItemDescriptions[sectionIndex%mockedFullWidthItemDescriptions.count].uppercased()
        imageView.image = UIImage(named: mockedImageNames[sectionIndex%mockedImageNames.count])
        
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
    
}
