//
//  User.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 11-03-21.
//

import Foundation

struct User: Codable {
    var login : String?
    var avatarUrl : String?
    var name : String?
    var location : String?
    var bio : String?
    var publicRepos : Int?
    var publicGists : Int?
}
