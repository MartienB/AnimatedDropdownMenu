//
//  LeftTypeOneViewController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/3.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit
import AnimatedDropdownMenu

class LeftTypeOneViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate let dropdownItems: [AnimatedDropdownMenu.Item] = [
        AnimatedDropdownMenu.Item.init("From | Photography",
                                       UIImage(named: "icon_photography")!,
                                       UIImage(named: "icon_photography_light")!
        ),
        AnimatedDropdownMenu.Item.init("From | Artwork",
                                       UIImage(named: "icon_artwork")!,
                                       UIImage(named: "icon_artwork_light")!
        ),
        AnimatedDropdownMenu.Item.init("Others",
                                       UIImage(named: "icon_other")!,
                                       UIImage(named: "icon_other_light")!
        )
    ]
    
    fileprivate var selectedStageIndex: Int = 0
    fileprivate var lastStageIndex: Int = 0
    fileprivate var dropdownMenu: AnimatedDropdownMenu!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAnimatedDropdownMenu()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        resetNavigationBarColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        dropdownMenu.show()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupAnimatedDropdownMenu() {
        
        let dropdownMenu = AnimatedDropdownMenu(navigationController: navigationController, containerView: view, selectedIndex: selectedStageIndex, items: dropdownItems)
        
        dropdownMenu.cellBackgroundColor = UIColor.menuGreenColor()
        dropdownMenu.menuTitleColor = UIColor.menuLightTextColor()
        dropdownMenu.menuArrowTintColor = UIColor.menuLightTextColor()
        dropdownMenu.cellTextColor = UIColor.init(white: 1.0, alpha: 0.3)
        dropdownMenu.cellTextSelectedColor = UIColor.menuLightTextColor()
        dropdownMenu.cellTextAlignment = .left
        dropdownMenu.cellSeparatorColor = .clear
        
        dropdownMenu.didSelectItemAtIndexHandler = {
            [weak self] selectedIndex in
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.lastStageIndex = strongSelf.selectedStageIndex
            strongSelf.selectedStageIndex = selectedIndex
            
            guard strongSelf.selectedStageIndex != strongSelf.lastStageIndex else {
                return
            }
            
            //Configure Selected Action
            strongSelf.selectedAction()
        }
        
        self.dropdownMenu = dropdownMenu
        navigationItem.titleView = dropdownMenu
    }
    
    private func selectedAction() {
        print("\(dropdownItems[selectedStageIndex].title)")
    }
    
    fileprivate func resetNavigationBarColor() {
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.menuGreenColor()
        
        let textAttributes: [String: Any] = [
            convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.menuLightTextColor(),
            convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.navigationBarTitleFont()
        ]
        
        navigationController?.navigationBar.titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary(textAttributes)
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
