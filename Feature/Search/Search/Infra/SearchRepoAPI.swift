//
//  SearchRepoAPI.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift
import GithubRepository

public struct SearchRepoAPI: RepoRepository {
    
    public init() {
        
    }
    
    public func fetch(q: String) -> Single<RepositoryEntity> {
        // TODO: GithubAPIを利用
        return Single<RepositoryEntity>.just(SearchRepository(items: []))
    }
}
