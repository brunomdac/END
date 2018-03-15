//
//  UICollectionViewCell+Extension.swift
//  END
//
//  Created by Bruno Cunha on 15/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
        
    class func cellIdentifier() -> String {
        return String(describing: self)
    }
}
