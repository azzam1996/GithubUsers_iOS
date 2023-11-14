//
//  Resource.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import Foundation

enum Resource<T> {
    case Success(data: T)
    case Error(errorCode: Int, errorMessage: String?)
}
