//
//  SearchDataSource.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/22.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public final class SearchDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    public typealias Element = [SearchCellModel]
    private var _items: [SearchCellModel] = []
    
    private let _didTapFavorite = PublishRelay<IndexPath>()
    public var didTapFavorite: Signal<IndexPath> {
        return _didTapFavorite.asSignal()
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCell(for: indexPath)
        let cellModel = _items[indexPath.row]
        cell.config(cellModel: cellModel)
        cell.favoriteButton
            .rx.tap
            .map { _ in indexPath }
            .bind(to: _didTapFavorite)
            .disposed(by: cell.disposeBag)
        
        return cell
    }
    
    // MARK: RxTableViewDataSourceType
    
    public func tableView(_ tableView: UITableView, observedEvent: Event<Element>) {
        Binder(self) { dataSource, element in
            dataSource._items = element
            tableView.reloadData()
            }
            .on(observedEvent)
    }
}
