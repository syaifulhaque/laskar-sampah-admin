//
//  ExampleStickyHeroView.swift
//  StickyHeaderTabController_Example
//
//  Created by Egi on 10/12/18.
//  Copyright (c) 2018 Egi. All rights reserved.
//

import UIKit
import StickyHeaderTabController

class ExampleStickyHeroView: UIView {

    // MARK: - Properties

    var avatarSizePercentage: CGFloat = 1.0 {
        didSet {
            if oldValue != avatarSizePercentage {
                setNeedsLayout()
            }
        }
    }

    // MARK: Views

    let avatarImageView = UIImageView()
    let nameLabel = UILabel()
    let labelAddress = UILabel()

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
        heightAnchor.constraint(equalToConstant: 80.0).isActive = true

        backgroundColor = #colorLiteral(red: 0.2125127912, green: 0.464619875, blue: 0.370632112, alpha: 1)

        setUpAvatar()
        setUpNameLabel()
    }

    private func setUpAvatar() {
        addSubview(avatarImageView)
        avatarImageView.image = UIImage(named: "bankSampah")
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.backgroundColor = .white

        avatarImageView.layer.cornerRadius = 10.0
        avatarImageView.layer.masksToBounds = true
    }

    private func setUpNameLabel() {
        addSubview(nameLabel)
        nameLabel.text = "Bank Sampah Omah Hijau"
        labelAddress.text = "Jalan Damai No. 12, Serpong"
        addSubview(labelAddress)
    }

    override func layoutSubviews() {
        // Constants
        let marginWidth: CGFloat = 10.0

        // Avatar frame
        let minimumSize: CGFloat = 50.0
        let maximumSize: CGFloat = 100.0

        let avatarSize: CGFloat = minimumSize + (avatarSizePercentage * (maximumSize - minimumSize))
        let avatarTopOffset: CGFloat = 55.0 - avatarSize
        avatarImageView.frame = CGRect(x: marginWidth,
                                       y: avatarTopOffset,
                                       width: avatarSize,
                                       height: avatarSize)

        // Name label frame
        let nameHeight: CGFloat = 30.0
        let nameTopOffset: CGFloat = 3.0
        nameLabel.frame = CGRect(x: marginWidth + nameTopOffset + avatarImageView.frame.width + nameTopOffset ,
                                 y: avatarTopOffset + avatarImageView.frame.height / 2 + nameTopOffset,
                                 width: bounds.width - (2.0 * marginWidth),
                                 height: nameHeight)
        nameLabel.autoresizingMask = [.flexibleWidth]
        labelAddress.frame = CGRect(x: nameLabel.frame.origin.x,
                                 y: nameLabel.frame.origin.y + 20.0,
                                 width: bounds.width - (2.0 * marginWidth),
                                 height: nameHeight)
        labelAddress.autoresizingMask = [.flexibleWidth]
    }
}
