//
//  GithubUsersMappers.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/14/23.
//

import Foundation

extension GithubUserDto {
    public func toGithubUser() -> GithubUser {
        return GithubUser(
            id: self.id,
            email: self.email,
            name: self.name,
            bio: self.bio,
            avatarUrl: self.avatarUrl,
            login: self.login,
            company: self.company,
            followers: self.followers,
            following: self.following,
            publicRepos: self.publicRepos,
            publicGists: self.publicGists,
            location: self.location,
            twitterUsername: self.twitterUsername)
    }
}
