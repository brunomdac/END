//
//  CustomReusableHeader.swift
//  END
//
//  Created by Bruno Cunha on 15/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class CustomHeaderCell: UICollectionViewCell {
    
    private lazy var leftLabel = UILabel()
    private lazy var rightLabel = UILabel()
    
    func setup(leftText: String, rightText: String) {
        setupViews()
        
        leftLabel.text = leftText.capitalized
        rightLabel.text = rightText.capitalized
        
        setupConstraints()
    }
    
    func setupViews() {
        
        self.addSubview(leftLabel)
        self.addSubview(rightLabel)
        
        backgroundColor = UIColor.white
        
    }
    
    func setupConstraints() {
        leftLabel.snp.makeConstraints { make in
            make.leading.centerY.height.equalToSuperview()
            make.trailing.lessThanOrEqualTo(rightLabel.snp.leading).offset(8)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.trailing.centerY.height.equalToSuperview()
        }
    }
    
}
