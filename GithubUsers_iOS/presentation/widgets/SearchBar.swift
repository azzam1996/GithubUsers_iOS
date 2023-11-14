//
//  SearchBar.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/13/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            
            HStack {
                Image(uiImage: UIImage(named: "ic_search")!)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.init("valentino"))
                    .padding(EdgeInsets.init(top: 5, leading: 20, bottom: 5, trailing: 5))
                    .frame(width: 50, height: 50, alignment: Alignment.center)
                
                    TextField("Search ...",text: $searchText)
                        .padding(EdgeInsets.init(top: 15, leading: 10, bottom: 15, trailing: 10))
                        .foregroundColor(Color.init("valentino"))
                        .lineLimit(1)
                        .frame(
                              minWidth: 0,
                              maxWidth: .infinity,
                              alignment: .center
                            )
            }
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
