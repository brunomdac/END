//
//  CustomReusableHeader.swift
//  END
//
//  Created by Bruno Cunha on 15/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class CustomHeaderCell: UICollectionViewCell {
    
    let horizontalOffset: CGFloat = 8
    private lazy var leftLabel = UILabel()
    private lazy var rightLabel = UILabel()
    
    func setup(leftText: String, rightText: String) {
        setupViews()
        
        leftLabel.text = leftText.uppercased()
        
        leftLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: rightText.uppercased(), attributes: underlineAttribute)
        rightLabel.attributedText = underlineAttributedString
        
        setupConstraints()
    }
    
    func setupViews() {
        
        self.addSubview(leftLabel)
        self.addSubview(rightLabel)
        
        backgroundColor = UIColor.white
        
    }
    
    func setupConstraints() {
        leftLabel.snp.makeConstraints { make in
            make.centerY.height.equalToSuperview()
            make.leading.equalToSuperview().offset(horizontalOffset)
            make.trailing.lessThanOrEqualTo(rightLabel.snp.leading).offset(horizontalOffset)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.centerY.height.equalToSuperview()
            make.trailing.equalToSuperview().offset(-horizontalOffset)
        }
    }
    
}
