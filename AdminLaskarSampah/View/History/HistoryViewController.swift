//
//  HistoryViewController.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 10/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit
import StickyHeaderTabController

class HistoryViewController: StickyHeaderTabController {
    
    // MARK: - Properties
    
    private let exampleHeader = ExampleStickyHeaderView()
    private let exampleHero = ExampleStickyHeroView()
    private let exampleTabBar = ExampleTabBar(frame: .zero)
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        commonInit()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Setup
    
    private func commonInit() {
        delegate = self as! StickyHeaderTabControllerDelegate
        
        stickyHeader = exampleHeader
        hero = exampleHero
        tabBar = exampleTabBar
        tabs = [StatesTabViewController()]
    }
    
    // Private Methods
    
    fileprivate func updateAvatarSize() {
        let maxValue = exampleHeader.bounds.height
        let minValue = exampleHeader.pinnedHeight
        let currentValue = exampleHero.frame.origin.y
        
        let percentage = min(max(0, ((currentValue - minValue) / (maxValue - minValue))), 1)
        exampleHero.avatarSizePercentage = percentage
    }
    
    fileprivate func updateNameLabel() {
        let headerBottom = exampleHeader.frame.origin.y + exampleHeader.frame.size.height
        
        let heroTop = exampleHero.frame.origin.y
        let heroNameOffset = exampleHero.nameLabel.frame.origin.y
        let nameTop = heroTop + heroNameOffset
        
        let overlapPx = max(0, headerBottom - nameTop)
        let percentage = min(max(0, (overlapPx / exampleHero.nameLabel.bounds.height)), 1)
        exampleHeader.percentVisibleName = percentage
    }
    
    fileprivate func updateBlur() {
        let headerBottom = exampleHeader.frame.origin.y + exampleHeader.frame.size.height
        let heroTop = exampleHero.frame.origin.y
        let overlapPx = max(0, headerBottom - heroTop)
        let percentage = min(max(0, (overlapPx / exampleHero.bounds.height)), 1)
        exampleHeader.percentVisibleBlur = percentage
    }
}

extension HistoryViewController: StickyHeaderTabControllerDelegate {
    func stickyHeaderTabControllerDidScrollVertically(_ controller: StickyHeaderTabController) {
        updateAvatarSize()
        updateNameLabel()
        updateBlur()
    }
}

