//
//  ExampleStickyHeaderView.swift
//  StickyHeaderTabController_Example
//
//  Created by Egi on 10/12/18.
//  Copyright (c) 2018 Egi. All rights reserved.
//

import UIKit
import StickyHeaderTabController

class ExampleStickyHeaderView: StickyHeaderView {

    // MARK: - Properties

    override public var pinnedHeight: CGFloat {
        return 60.0
    }

    var percentVisibleName: CGFloat = 0.0 {
        didSet {
            if percentVisibleName != oldValue {
                updateNameFrame()
            }
        }
    }

    var percentVisibleBlur: CGFloat = 0.0 {
        didSet {
            blurEffectView.alpha = percentVisibleBlur
        }
    }

    let coverImageView = UIImageView()
    let nameLabel = UILabel()
    let blurEffectView = UIVisualEffectView()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func commonSetup() {
        let heightConstraint = heightAnchor.constraint(equalToConstant: 170.0)
        heightConstraint.priority = UILayoutPriority(rawValue: 500.0)
        heightConstraint.isActive = true

        setUpAvatar()
        setUpBlur()
        setUpNameLabel()
    }

    private func setUpAvatar() {
        addSubview(coverImageView)
        coverImageView.image = UIImage(named: "steve-johnson-548294-unsplash")
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.frame = bounds
        coverImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    // Blur effect on top of coverImageView
    private func setUpBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        addSubview(blurEffectView)
        blurEffectView.effect = blurEffect

        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        percentVisibleBlur = 0.0
    }

    private func setUpNameLabel() {
        addSubview(nameLabel)
        nameLabel.text = "Bank Sampah Omah Hijau"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.sizeToFit()
        updateNameFrame()
    }

    // MARK: - Overrides

    override func layoutSubviews() {
        super.layoutSubviews()

        updateNameFrame()
    }

    // MARK: - Private Methods

    private func updateNameFrame() {
        let statusBarHeight: CGFloat = 10.0
        let baseline = bounds.height - pinnedHeight + statusBarHeight
        let minYValue = ((pinnedHeight - nameLabel.bounds.height) / 2.0) + baseline
        let maxYValue = bounds.height

        let yValue = minYValue + ((maxYValue - minYValue) * (1.0 - percentVisibleName))
        nameLabel.frame = CGRect(x: 0,
                                 y: yValue,
                                 width: bounds.width,
                                 height: nameLabel.bounds.height)
    }
}
