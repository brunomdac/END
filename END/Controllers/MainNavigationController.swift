//
//  MainNavigationController.swift
//  END
//
//  Created by Bruno Cunha on 14/03/2018.
//  Copyright © 2018 Bruno Cunha. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        if viewControllers.count == 1, let vc = viewControllers.last {
            self.addLogoToNavigationItem(vc.navigationItem)
        }
    }
    
    func addLogoToNavigationItem(_ navigationItem: UINavigationItem) {
        navigationItem.title = "END."
        let font = UIFont(name: "Helvetica", size: 40)!
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: font]
    }
    
    @objc func titleLogoTapped() {
        print("Title tapped")
    }
    
    
}
