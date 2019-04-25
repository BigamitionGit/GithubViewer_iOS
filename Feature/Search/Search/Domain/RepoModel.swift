//
//  RepoModel.swift
//  Search
//
//  Created by hosoda-hiroshi on 2019/04/18.
//  Copyright © 2019 hosoda-hiroshi. All rights reserved.
//

import Foundation
import GithubRepository

public struct RepoModel {
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
    let isFavorite: Bool
}
