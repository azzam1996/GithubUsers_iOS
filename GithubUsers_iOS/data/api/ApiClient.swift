//
//  ApiClient.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import Foundation

class ApiClient: Api {
    
    func searchGithubUsers(keyword: String, completion : @escaping (Resource<SearchGithubUsersDto?>) -> ()) {
        guard let url = URL(string: "https://api.github.com/search/users?q=" + keyword) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        
            do {
                if data != nil {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let searchUsers = try decoder.decode(SearchGithubUsersDto.self, from: data!)
                    completion(Resource.Success(data: searchUsers) )
                }
                else {
                    completion(Resource.Error(errorCode: (response as? HTTPURLResponse)?.statusCode ?? -1, errorMessage: error?.localizedDescription))
                }
            }
            catch {
                completion(Resource.Error(errorCode: (response as! HTTPURLResponse).statusCode, errorMessage: error.localizedDescription))
                print(error)
            }
        })
        task.resume()
    }
    
    func getGithubUser(username: String?, completion: @escaping (Resource<GithubUserDto>) -> ()) {
        guard let url = URL(string: "https://api.github.com/users/" + getValueOrNoData(value: username)) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        
            do {
                if data != nil {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let user = try decoder.decode(GithubUserDto.self, from: data!)
                    completion(Resource.Success(data: user) )
                }
                else {
                    completion(Resource.Error(errorCode: (response as? HTTPURLResponse)?.statusCode ?? -1, errorMessage: error?.localizedDescription))
                }
            }
            catch {
                completion(Resource.Error(errorCode: (response as! HTTPURLResponse).statusCode, errorMessage: error.localizedDescription))
                print(error)
            }
        })
        task.resume()
    }

}
