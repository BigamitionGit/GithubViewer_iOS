//
//  SearchViewController.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/22.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import UIKitSupport

public class SearchViewController: UIViewController {

    @IBOutlet public weak var searchBar: UISearchBar!
    @IBOutlet public weak var tableView: UITableView!
    
    public let dataSource = SearchDataSource()
    public let disposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchCell.self)
    }
}
