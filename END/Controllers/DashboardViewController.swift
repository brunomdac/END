//
//  DashboardViewController.swift
//  END
//
//  Created by Bruno Cunha on 14/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import Foundation
import SnapKit

class DashboardViewController: UIViewController {
    
    //MARK: Constants
    private let byDefaultMargin = 8
    private let horizontalCollectionViewHeight = 600
    
    
    //MARK: Constraints
    private let ratioMainButtonToScreenHeight = 0.5
    private let ratioHorizontalScrollViewToScreenHeight = 0.7
    private let ratioVerticalScrollViewToScreenHeight = 2
    
    let horizontalEdgeInset: CGFloat = 4
    let verticalEdgeInsetValue: CGFloat = 4
    
    //MARK: Properties
    
    var collectionView: UICollectionView!
    
    //MARK: Methods
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.white
        
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 8
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.cellIdentifier())
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier())
        collectionView.register(CustomHeaderCell.self, forCellWithReuseIdentifier: CustomHeaderCell.cellIdentifier())
        collectionView.register(FullWidthInventoryItem.self, forCellWithReuseIdentifier: FullWidthInventoryItem.cellIdentifier())
        collectionView.register(HalfWidthInventoryItem.self, forCellWithReuseIdentifier: HalfWidthInventoryItem.cellIdentifier())
        
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        
    }
    
}
