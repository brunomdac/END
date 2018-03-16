//
//  FullWidthInventoryItem.swift
//  END
//
//  Created by Bruno Cunha on 16/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class FullWidthInventoryItem: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
    
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        backgroundColor = UIColor.green.withAlphaComponent(0.3)
        imageView.contentMode = .scaleAspectFit
        titleLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        titleLabel.textColor = UIColor.white
        descriptionLabel.textColor = UIColor.white
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        descriptionLabel.font = descriptionLabel.font.withSize(20)
        
        
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(16)
        }
    }
    
    func setup() {
        setupViews()
        setupConstraints()
    }
    
}
