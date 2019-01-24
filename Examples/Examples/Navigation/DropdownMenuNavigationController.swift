//
//  DropdownMenuNavigationController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/1.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class DropdownMenuNavigationController: UINavigationController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        configNavigationBar()
    }
    
    private func configNavigationBar() {
        navigationBar.backgroundColor = nil
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = nil
        navigationBar.barStyle = .black
        navigationBar.setBackgroundImage(nil, for: .default)
        
        let textAttributes: [String: Any] = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.menuLightTextColor(),
            convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.navigationBarTitleFont()
        ]
        
        navigationBar.titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary(textAttributes)
        navigationBar.tintColor = UIColor.menuLightTextColor()
        
        navigationBar.barTintColor = UIColor.menuLightTextColor()
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
