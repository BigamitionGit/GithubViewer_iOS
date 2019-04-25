//
//  SearchRepo.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import GithubRepository

struct SearchRepository: RepositoryEntity {
    let items: [RepositoryItemEntity]
}

struct SearchRepo: Codable {
    let items: [SearchRepoItem]
}

struct SearchRepoItem: Codable, RepositoryItemEntity {
    let id: Int
    
    let name: String
    
    let ownerName: String
    
    let access: Access
    
    let url: String
    
    let description: String
    
    let updateDate: Date
    
    let starCount: Int
    
    let wacherCount: Int
    
    let forkCount: Int
    
    let language: String
    
    
}

extension Access: Codable {
    private enum CodingKeys: String, CodingKey {
        case `private`
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let isPrivate = try container.decode(Bool.self, forKey: .private)
        if isPrivate {
            self = .private
        } else {
            self = .public
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self == .private, forKey: .private)
    }
}
