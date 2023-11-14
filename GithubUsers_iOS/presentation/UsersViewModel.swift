//
//  UsersViewModel.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import Foundation

class UsersViewModel: ObservableObject{
    var usersRepository: UsersRepository?
    var work: DispatchWorkItem? = nil
    
    @Published private (set) var loading: Bool = false
    @Published private (set) var errorMessage: String? = nil
    @Published private (set) var usersList = [GithubUser]()
    @Published private (set) var user: GithubUser? = nil
    @Published var showError: Bool = false
    @Published var searchText = "" {
        didSet {
            print(searchText)
            work?.cancel()
            if searchText.count >= 2 {
                self.work = DispatchWorkItem(block: {
                    self.searchUsers(keyword: self.searchText)
                })
                if work != nil {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.work!)
                }
            }
        }
    }
    
    init(usersRepository: UsersRepository?) {
        self.usersRepository = usersRepository
    }
    
    func searchUsers(keyword: String) {
        loading = true
        usersRepository?.searchGithubUsers(keyword: keyword,completion: { response in
            switch response {
               case .Success(data: let data):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.usersList = data ?? []
                    self.loading = false
                }
               case .Error(errorCode: let errorCode, errorMessage: let errorMessage):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.loading = false
                    self.showError = true
                    self.errorMessage = "\(getValueOrNoData(value: errorCode))  \(getValueOrNoData(value: errorMessage))"
                }
            }
        })
    }
    
    func getUser(username: String?) {
        loading = true
        usersRepository?.getGithubUser(username: username,completion: { response in
            switch response {
               case .Success(data: let data):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.user = data
                    self.loading = false
                }
               case .Error(errorCode: let errorCode, errorMessage: let errorMessage):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.loading = false
                    self.showError = true
                    self.errorMessage = "\(getValueOrNoData(value: errorCode))  \(getValueOrNoData(value: errorMessage))"
                }
            }
        })
    }
}
