//
//  SearchStore.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/19.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchStore {
    var query: Driver<String?> {
        return _query.asDriver()
    }
    private let _query = BehaviorRelay<String?>(value: nil)
    
    var isFetching: Driver<Bool> {
        return _isFetching.asDriver()
    }
    private let _isFetching = BehaviorRelay<Bool>(value: false)
    
    var repositories: Driver<[RepoModel]> {
        return _repositories.asDriver()
    }
    private let _repositories = BehaviorRelay<[RepoModel]>(value: [])
    
    var showErrorMessage: Signal<String> {
        return _showErrorMessage.asSignal()
    }
    private let _showErrorMessage = PublishRelay<String>()
    
    private let disposeBag = DisposeBag()
    
    init(dispatcher: SearchDispatcher) {
        dispatcher.query
            .bind(to: _query)
            .disposed(by: disposeBag)
        
        dispatcher.repositories
            .bind(to: _repositories)
            .disposed(by: disposeBag)
        
        dispatcher.isFetching
            .bind(to: _isFetching)
            .disposed(by: disposeBag)
        
        dispatcher.showMessage
            .bind(to: _showErrorMessage)
            .disposed(by: disposeBag)
    }
}       
