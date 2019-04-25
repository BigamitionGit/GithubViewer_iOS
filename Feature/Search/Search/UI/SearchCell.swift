//
//  SearchCell.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/22.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import UIKit
import RxSwift
import UIKitSupport

public protocol SearchCellModel {
    var title: String { get }
    var starCount: String { get }
    var isFavorite: Bool { get }
}

public class SearchCell: UITableViewCell, ReusableView, NibLoadableView {

    static let identifier: String = "SearchCell"
    public let disposeBag = DisposeBag()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    public func config(cellModel: SearchCellModel) {
        titleLabel.text = cellModel.title
        starCountLabel.text = cellModel.starCount
        if cellModel.isFavorite {
            favoriteButton.setTitle("★", for: .normal)
        } else {
            favoriteButton.setTitle("☆", for: .normal)
        }
    }
}
