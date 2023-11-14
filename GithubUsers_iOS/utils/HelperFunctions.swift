//
//  HelperFunctions.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/12/23.
//

import Foundation

func getValueOrNoData(value: String?) -> String {
    return value ?? "NO DATA"
}

func getValueOrNoData(value: Int?) -> String {
    if value != nil {
        return String(value!)
    }
    return "NO DATA"
}
