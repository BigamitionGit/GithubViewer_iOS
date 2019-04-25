//
//  SearchActionCreator.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/19.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    func mapToError<E: Error>() -> Observable<E> {
        return Observable.create { observer in
            self.subscribe(onError: { error in
                if let e = error as? E {
                    observer.onError(e)
                }
            })
        }
    }
}

public protocol RepoSearchable {
    func search(q: String) -> Single<[RepoModel]>
}

public final class SearchActionCreator {
    private let dispatcher: SearchDispatcher
    
    private let _searchRepositories = PublishRelay<String>()
    private let disposeBag = DisposeBag()
    
    init(dispatcher: SearchDispatcher,
         repoSearchable: RepoSearchable) {
        self.dispatcher = dispatcher
        let isFetching = PublishRelay<Bool>()
        
        let repositories = _searchRepositories
            .flatMap(repoSearchable.search)
            .do(onSubscribe: { isFetching.accept(true)}, onDispose: { isFetching.accept(false) })
            .share()
        
        isFetching
            .bind(to: dispatcher.isFetching)
            .disposed(by: disposeBag)
        
        let fetchError: Observable<RepoUseCase.ErrorActions> = repositories
            .mapToError()
            .share()
        
        fetchError
            .flatMap { $0.exception }
            .bind(to: dispatcher.exception)
            .disposed(by: disposeBag)
        
        fetchError
            .flatMap { $0.message }
            .bind(to: dispatcher.showMessage)
            .disposed(by: disposeBag)
        
        repositories
            .bind(to: dispatcher.repositories)
            .disposed(by: disposeBag)
        
        _searchRepositories
            .bind(to: dispatcher.query)
            .disposed(by: disposeBag)
    }
    
    func searchRepositories(query: String) {
        _searchRepositories.accept(query)
    }
}
