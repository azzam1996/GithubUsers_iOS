//
//  Api.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import Foundation

protocol Api {
    func searchGithubUsers(keyword: String, completion : @escaping (Resource<SearchGithubUsersDto?>) -> ())
    func getGithubUser(username: String?, completion : @escaping (Resource<GithubUserDto>) -> ())
}
