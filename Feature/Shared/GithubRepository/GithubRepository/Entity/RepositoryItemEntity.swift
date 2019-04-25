//
//  RepositoryItemEntity.swift
//  Repository
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation

public protocol RepositoryItemEntity {
    var id: Int { get }
    var name: String { get }
    var ownerName: String { get }
    var access: Access { get }
    var url: String { get }
    var description: String { get }
    var updateDate: Date { get }
    var starCount: Int { get }
    var wacherCount: Int { get }
    var forkCount: Int { get }
    var language: String { get }
}

public enum Access {
    case `private`
    case `public`
}
