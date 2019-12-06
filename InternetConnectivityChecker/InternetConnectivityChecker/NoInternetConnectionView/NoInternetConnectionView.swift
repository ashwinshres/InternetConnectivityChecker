//
//  NoInternetConnectionView.swift
//  Yatru
//
//  Created by Insight Workshop on 12/5/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//

import UIKit

class NoInternetConnectionView: ICCBaseNibLoadAbleView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet var wrapperBackgroundView: UIView!
    
    override func commonInit() {
        loadNib(NoInternetConnectionView.self)
        update(contentView)
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        beautifyView()
    }
    
    private func beautifyView() {
        wrapperBackgroundView.backgroundColor = .clear
        wrapperBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        wrapperBackgroundView.layer.shadowOffset = CGSize(width:0.0, height: -10.0)
        wrapperBackgroundView.layer.shadowOpacity = 0.9
        wrapperBackgroundView.layer.shadowRadius = 20.0
        wrapperView.layer.cornerRadius = 30.0
        wrapperView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        beautifyView()
    }
    
}

