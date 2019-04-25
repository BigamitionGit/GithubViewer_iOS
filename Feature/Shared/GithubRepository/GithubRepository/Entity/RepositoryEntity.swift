//
//  RepositoryEntity.swift
//  Repository
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation

public protocol RepositoryEntity {
    var items: [RepositoryItemEntity] { get }
}
