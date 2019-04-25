//
//  ReusableView.swift
//  UIKitSupport
//
//  Created by hosoda-hiroshi on 2019/04/23.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import UIKit

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
