//
//  DashboardViewController+DataSource.swift
//  END
//
//  Created by Bruno Cunha on 14/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

extension DashboardViewController: UICollectionViewDataSource {
    
    // MARK: Section/Cell enums
    
    enum Sections: Int {
        case bigImage = 0,
        /**
            The horizontal collection view header wasn't behaving the way I expected,
            so I opted for a new UIView instead
         */
        firstHeader,
        horizontalCollectionView,
        secondHeader,
        firstFullWidthItem,
        secondFullWidthItem,
        halfWidthItems
        
        static var count: Int { return Sections.halfWidthItems.rawValue + 1}
    }
    
    enum BigImageSectionCells: Int {
        case bigImage = 0
        
        static var count: Int { return BigImageSectionCells.bigImage.rawValue + 1}
    }
    
    enum horizontalCollectionViewCells: Int {
        case collection = 0
        
        static var count: Int { return horizontalCollectionViewCells.collection.rawValue + 1}
    }
    
    enum listOfItemsCells: Int {
        case fullWidthCell = 0,
        halfWidth
        
        static var count: Int { return listOfItemsCells.halfWidth.rawValue + 1}
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Sections(rawValue: section) == .halfWidthItems ? 12 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        
        switch Sections(rawValue: indexPath.section) ?? .halfWidthItems {
        case .bigImage:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.cellIdentifier(), for: indexPath) as? ImageCollectionViewCell
            (cell as? ImageCollectionViewCell)?.setup()
            
        case .firstHeader:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHeaderCell.cellIdentifier(), for: indexPath) as? CustomHeaderCell
            (cell as? CustomHeaderCell)?.setup(leftText: "Latest", rightText: "View All")
            
        case .horizontalCollectionView:
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier(), for: indexPath) as? HorizontalCollectionViewCell
            (cell as? HorizontalCollectionViewCell)?.setup()
            
        case .secondHeader:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHeaderCell.cellIdentifier(), for: indexPath) as? CustomHeaderCell
            (cell as? CustomHeaderCell)?.setup(leftText: "Brands", rightText: "Brands A-Z")
            
        case .firstFullWidthItem,
             .secondFullWidthItem:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullWidthInventoryItem.cellIdentifier(), for: indexPath) as? FullWidthInventoryItem
            (cell as? FullWidthInventoryItem)?.setup()
        
        case .halfWidthItems:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: HalfWidthInventoryItem.cellIdentifier(), for: indexPath) as? HalfWidthInventoryItem
            (cell as? HalfWidthInventoryItem)?.setup()
            
        }
        
        return cell
    }
    
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch Sections(rawValue: indexPath.section) ?? .halfWidthItems {
        case .bigImage:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height/2)
        case .horizontalCollectionView:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height*0.75)
        case .firstFullWidthItem,
             .secondFullWidthItem:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height*0.25)
        case .halfWidthItems:
            return CGSize(width: collectionView.frame.size.width/2 - 2*horizontalEdgeInset, height: collectionView.frame.size.height*0.25)
        case .firstHeader,
             .secondHeader:
            return CGSize(width: collectionView.frame.size.width, height: 60)
        }
        
    }
}
