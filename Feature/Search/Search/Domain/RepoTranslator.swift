//
//  RepoTranslator.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import GithubRepository

public protocol RepoTranslator {
    func translator(entity: RepositoryItemEntity, isFavorite: Bool) -> RepoModel
}

public struct RepoTranslatorImpl: RepoTranslator {
    public func translator(entity: RepositoryItemEntity, isFavorite: Bool) -> RepoModel {
        return RepoModel(id: entity.id,
                         name: entity.name,
                         ownerName: entity.ownerName,
                         access: entity.access,
                         url: entity.url,
                         description: entity.description,
                         updateDate: entity.updateDate,
                         starCount: entity.starCount,
                         wacherCount: entity.wacherCount,
                         forkCount: entity.forkCount,
                         language: entity.language,
                         isFavorite: isFavorite)
    }
}
