//
//  RepositoryImpl.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/14/23.
//

import Foundation

class UsersRepositoryImpl : UsersRepository {
    let api: Api
    
    init(api: Api) {
        self.api = api
    }
    
    func searchGithubUsers(keyword: String, completion: @escaping (Resource<[GithubUser]?>) -> ()) {
        api.searchGithubUsers(keyword: keyword,completion: { response in
            switch response {
                case .Success(data: let data):
                    completion(Resource.Success(data: data?.items.map { dto in
                        dto.toGithubUser()
                    }))
                case .Error(errorCode: let errorCode, errorMessage: let errorMessage):
                    completion(Resource.Error(errorCode: errorCode, errorMessage: errorMessage))
            }
        })
    }
    
    func getGithubUser(username: String?, completion: @escaping (Resource<GithubUser?>) -> ()) {
        api.getGithubUser(username: username,completion: { response in
            switch response {
                case .Success(data: let data):
                    completion(Resource.Success(data: data.toGithubUser()))
                case .Error(errorCode: let errorCode, errorMessage: let errorMessage):
                    completion(Resource.Error(errorCode: errorCode, errorMessage: errorMessage))
            }
        })
    }
}
