//
//  UsersRepository.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/14/23.
//

import Foundation

protocol UsersRepository {
    func searchGithubUsers(keyword: String, completion : @escaping (Resource<[GithubUser]?>) -> ())
    func getGithubUser(username: String?, completion : @escaping (Resource<GithubUser?>) -> ())
}
