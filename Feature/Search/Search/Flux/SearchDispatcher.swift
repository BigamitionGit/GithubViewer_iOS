//
//  SearchDispatcher.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/19.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public final class SearchDispatcher {
    public let query = PublishRelay<String?>()
    public let repositories = PublishRelay<[RepoModel]>()
    public let clearRepositories = PublishRelay<Void>()
    public let isFetching = PublishRelay<Bool>()
    public let showMessage = PublishRelay<String>()
    public let exception = PublishRelay<Void>()
}
