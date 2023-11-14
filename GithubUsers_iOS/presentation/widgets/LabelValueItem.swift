//
//  LabelValueItem.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/12/23.
//

import SwiftUI

struct LabelValueItem: View {
    let label: String
    let value: String?
    
    init(label: String, value: String?) {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        HStack {
            Text("\(label) : ")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Text(getValueOrNoData(value: value))
                .foregroundColor(Color.white)
        }
    }
}

struct LabelValueItem_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
