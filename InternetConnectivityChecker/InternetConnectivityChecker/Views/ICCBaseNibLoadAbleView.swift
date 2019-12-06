//
//  ICCBaseNibLoadAbleView.swift
//  InternetConnectivityChecker
//
//  Created by Insight Workshop on 12/6/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//

import UIKit

class ICCBaseNibLoadAbleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {}
    
    func update(_ contentView: UIView) {
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}

extension ICCBaseNibLoadAbleView: ICCReusableView,
ICCNibLoadableView {}

extension UIView {
    
    func loadNib<T: UIView>(_: T.Type) where T: ICCReusableView {
        Bundle.main.loadNibNamed(T.defaultReuseIdentifier, owner: self, options: nil)
    }
    
}

