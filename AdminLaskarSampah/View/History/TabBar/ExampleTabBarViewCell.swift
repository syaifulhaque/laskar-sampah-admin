//
//  ExampleTabBarViewCell.swift
//  StickyHeaderTabController_Example
//
//  Created by Egi on 10/12/18.
//  Copyright (c) 2018 Egi. All rights reserved.
//

import Foundation
import StickyHeaderTabController

class ExampleTabBarViewCell: StickyHeaderTabBarViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)

        textColor = UIColor(white: 0.63, alpha: 1)
        selectedTextColor = UIColor(white: 0.24, alpha: 1)
        bottomBorderColor = #colorLiteral(red: 0.2125127912, green: 0.464619875, blue: 0.370632112, alpha: 1)
        bottomBorderWidth = 4.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
