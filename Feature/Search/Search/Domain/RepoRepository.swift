//
//  RepoRepository.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift
import GithubRepository

public protocol RepoRepository {
    func fetch(q: String) -> Single<RepositoryEntity>
}
