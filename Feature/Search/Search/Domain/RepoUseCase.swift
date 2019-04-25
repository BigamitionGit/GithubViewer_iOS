//
//  RepoUseCase.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift

public protocol IsFavoriteRepository {
    func fetchIsFavorite(id: Int) -> Single<Bool>
}

public struct RepoUseCase {
    
    struct ErrorActions: Error {
        let message: Single<String>
        let exception: Single<Void>
        
        init(message: Single<String> = .never(),
             exception: Single<Void> = .never()) {
            self.message = message
            self.exception = exception
        }
    }

    private let isFavoriteRepository: IsFavoriteRepository
    private let repoRepository: RepoRepository
    private let repoTranslator: RepoTranslator
    
    public init(isFavoriteRepository: IsFavoriteRepository,
                repoRepository: RepoRepository,
                repoTranslator: RepoTranslator) {
        self.isFavoriteRepository = isFavoriteRepository
        self.repoRepository = repoRepository
        self.repoTranslator = repoTranslator
    }
    
    public func search(q: String) -> Single<[RepoModel]> {
        return repoRepository.fetch(q: q)
            .flatMap { [isFavoriteRepository, repoTranslator] entity-> Single<[RepoModel]> in
                Single
                    .zip(entity.items
                        .map { $0.id }
                        .map { id ->Single<Bool> in isFavoriteRepository.fetchIsFavorite(id: id) })
                    .map { favorites in
                        zip(entity.items, favorites)
                            .map(repoTranslator.translator)
                }
        }
    }
    
}
