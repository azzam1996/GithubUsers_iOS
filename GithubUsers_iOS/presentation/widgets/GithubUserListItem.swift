//
//  GithubUserListItem.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import SwiftUI
import Kingfisher

struct GithubUserListItem: View {
    let user: GithubUser
    let onClick: (GithubUser) -> ()
    
    init(user: GithubUser, onClick: @escaping (GithubUser) -> ()) {
        self.user = user
        self.onClick = onClick
    }
    
    var body: some View {
        Button(action: {
            onClick(self.user)
        }) {
            ZStack {
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 94, height: 94, alignment: Alignment.center)
                        
                        KFImage(URL(string: user.avatarUrl ?? "placeholder"))
                            .placeholder{
                                GrayCircle()
                            }
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 90, height: 90, alignment: Alignment.center)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Spacer()
                        
                        Text(user.login ?? "")
                            .font(.custom("sans-serif", size: 20))
                            .fontWeight(.bold)
                            .padding(.leading, 15)
                            .padding(.top, 20)
                            .foregroundColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                        
                        Text(String(user.id))
                            .font(.custom("sans-serif", size: 15))
                            .fontWeight(.light)
                            .padding(.top, 2)
                            .foregroundColor(Color.white)
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
            .padding(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient.init(
                                colors: [
                                    Color.init("valentino"),
                                    Color.init("vivid_violet")
                                ]
                            ),
                            startPoint: UnitPoint.bottomLeading,
                            endPoint: UnitPoint.topTrailing
                        )
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
        .padding(EdgeInsets.init(top: 0, leading: 10, bottom: 10, trailing: 10))
        .listRowBackground(Color("trans"))
    }
}

struct GithubUserListItem_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
