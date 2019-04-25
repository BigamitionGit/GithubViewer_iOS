//
//  UITableView+Reusable.swift
//  UIKitSupport
//
//  Created by hosoda-hiroshi on 2019/04/23.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import UIKit

public extension UITableView {
    
    //Registering Cell
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ : T.Type) -> T where T: ReusableView {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue Header/Footer with identifier: \(T.defaultReuseIdentifier)")
        }
        return headerFooter
    }
}
