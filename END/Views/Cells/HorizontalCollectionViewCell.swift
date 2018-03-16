//
//  HorizontalCollectionViewCell.swift
//  END
//
//  Created by Bruno Cunha on 15/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell, CustomCollectionViewCellProtocol {
    
    //MARK: Constraints
    let itemSizeRatio: CGFloat = 0.45
    
    //MARK: Properties
    var collectionView: UICollectionView!
    
    //MARK: ConvergentInitializationViewProtocol
    func setupViews() {
        
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets.zero
        collectionViewLayout.itemSize = CGSize.zero
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: collectionViewLayout)
        
        collectionView.contentSize = CGSize(width: 1000, height: self.bounds.height)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(InventoryItemCell.self, forCellWithReuseIdentifier: InventoryItemCell.cellIdentifier())
        
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
    }
    
    func setup() {
        setupViews()
        setupConstraints()
    }
    
}

extension HorizontalCollectionViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InventoryItemCell.cellIdentifier(), for: indexPath) as? InventoryItemCell
        cell?.setup()
        return cell ?? UICollectionViewCell()
    }
    
}

extension HorizontalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let edgeSize = self.bounds.height*0.5
        return CGSize(width: edgeSize * itemSizeRatio, height: edgeSize)
    }
}

extension HorizontalCollectionViewCell: UICollectionViewDelegate {
    
}
