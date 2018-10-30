//
//  ColorsTabViewController.swift
//  StickyHeaderTabController_Example
//
//  Created by Egi on 10/12/18.
//  Copyright (c) 2018 Egi. All rights reserved.
//

import UIKit
import StickyHeaderTabController

class ColorsTabViewController: StickyHeaderContentTabViewController {

    // MARK: - Properties

    fileprivate let cellIdentifier = "incomingCell"

    override open var scrollView: UIScrollView {
        return tableView
    }

    // MARK: Views

    private let tableView = UITableView()

    // MARK: - Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    // MARK: - Setup

    private func commonInit() {
        title = "Outcoming"

        setUpTableView()
    }

    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        // Frame
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Cell registration
        tableView.register(IncomingTableViewCell.nib, forCellReuseIdentifier: IncomingTableViewCell.identifier)
    }
}

// MARK: - UITableViewDataSource

extension ColorsTabViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TabData.states.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IncomingTableViewCell.identifier, for: indexPath) as! IncomingTableViewCell
        cell.titleCell.text = TabData.states[indexPath.row]
        cell.poinColorCell.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hc = HistoryDetailViewController()
//
//        hc.performSegue(withIdentifier: "detailTrx", sender: self)
        
        self.navigationController?.pushViewController(hc, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension ColorsTabViewController: UITableViewDelegate {  }
