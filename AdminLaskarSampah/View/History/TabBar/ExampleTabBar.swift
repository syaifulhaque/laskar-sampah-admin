//
//  ExampleTabBar.swift
//  StickyHeaderTabController_Example
//
//  Created by Egi on 10/12/18.
//  Copyright (c) 2018 Egi. All rights reserved.
//

import UIKit
import StickyHeaderTabController

class ExampleTabBar: StickyHeaderTabBarView {

    // MARK: - Properties
    private let exampleCellReuseIdentifier = "ExampleCellReuseIdentifier"

    // MARK: - Overrides

    override open func registerCellForReuse() {
        register(ExampleTabBarViewCell.self,
                 forCellWithReuseIdentifier: exampleCellReuseIdentifier)
    }

    override open func collectionView(_ collectionView: UICollectionView,
                                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        let title = tabDataSource?.stickyHeaderTabBarView(self, titleAtIndex: index)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: exampleCellReuseIdentifier,
                                                      for: indexPath) as! ExampleTabBarViewCell
        cell.title = title

        return cell
    }
}
