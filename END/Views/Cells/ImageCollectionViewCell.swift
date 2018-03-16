//
//  ImageCollectionViewCell.swift
//  END
//
//  Created by Bruno Cunha on 15/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    //MARK: Constraints
    let labelsVerticalOffset = 24
    
    //MARK: Properties
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
    //MARK: ConvergentInitializationViewProtocol
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        imageView.image = UIImage(named: "cover_photo")
        imageView.contentMode = .scaleAspectFill
        titleLabel.text = "Needles".uppercased()
        descriptionLabel.text = "That '70s Show."
        descriptionLabel.numberOfLines = 0
        
        titleLabel.textColor = UIColor.white
        descriptionLabel.textColor = UIColor.white
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        descriptionLabel.font = titleLabel.font.withSize(16)
        
    }
    
    func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-labelsVerticalOffset)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(labelsVerticalOffset)
        }
    }
    
    func setup() {
        setupViews()
        setupConstraints()
    }
    
}
