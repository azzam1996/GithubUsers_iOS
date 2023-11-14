//
//  UsersList.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import SwiftUI

struct UsersList: View {

    @StateObject var usersViewModel = UsersViewModel(usersRepository: UsersRepositoryImpl(api: ApiClient()))
    @State var isUserSelected = false
    @State var login: String? = nil

    
    var body: some View {
        
        ZStack {
            NavigationLink("", destination: UserDetails(login: login), isActive:$isUserSelected).hidden()
            
            MainBackground()
            
            ZStack {
                VStack {
                    SearchBar(searchText: $usersViewModel.searchText)
                        .padding(.all, 10)
                        .frame(width: UIScreen.main.bounds.width, height: 60, alignment: .center)
                    
                    Spacer()
                }
                .zIndex(100)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height,
                    alignment: .center
                )
                
                if(usersViewModel.loading) {
                    HStack(alignment:.center){
                        ProgressView()
                            .scaleEffect(2)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            .frame(width: 100,height: 100)
                    }
                }
                else {
                    if usersViewModel.usersList.isEmpty {
                        HStack(alignment:.center){
                            Text("NO DATA")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 100,height: 100)
                        }
                    }
                    else {
                        ScrollView {
                                LazyVStack {
                                    ForEach(usersViewModel.usersList, id: \.self.id) { user in
                                        GithubUserListItem(user: user) { data in
                                            print(data)
                                            login = data.login
                                            isUserSelected = true
                                        }
                                    }
                                }
                        }
                        .padding(EdgeInsets.init(top: 90, leading: 0, bottom: 70, trailing: 0))
                        .zIndex(9)
                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height, alignment: .center)
                    }
                }
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
        )
        .customDialog(isShowing: self.usersViewModel.showError) {
            VStack {
                Text(getValueOrNoData(value: self.usersViewModel.errorMessage))
                .padding(.bottom, 10)
                
                Button(action: {
                self.usersViewModel.showError = false
                    
                }) {
                    Text("Close dialog")
                        .autocapitalization(.allCharacters)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
              }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
            )
        }
    }
}

struct UsersList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
