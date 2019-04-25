//
//  NibLoadableView.swift
//  UIKitSupport
//
//  Created by hosoda-hiroshi on 2019/04/23.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
