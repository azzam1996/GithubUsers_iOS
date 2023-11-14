//
//  GithubUserDto.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import Foundation

struct GithubUserDto: Codable {
    let id: Int
    let email: String?
    let name: String?
    let bio: String?
    let avatarUrl: String?
    let login: String?
    let company: String?
    let followers: Int?
    let following: Int?
    let publicRepos: Int?
    let publicGists: Int?
    let location: String?
    let twitterUsername: String?
    
}

struct SearchGithubUsersDto: Codable {
    let items: [GithubUserDto]
}
