//
//  UserDetails.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/12/23.
//

import SwiftUI
import Kingfisher

struct UserDetails: View {
    @StateObject var usersViewModel = UsersViewModel(usersRepository: UsersRepositoryImpl(api: ApiClient()))
    
    private var login: String?

   
    init(login: String?) {
        self.login = login
    }
 
    
    var body: some View {
        ZStack {
            MainBackground()
            
            if usersViewModel.loading {
                HStack(alignment:.center){
                    ProgressView()
                        .scaleEffect(2)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .frame(width: 100,height: 100)
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .center
                    )
            }
            else {
                ScrollView {
                    VStack(alignment: .center) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.3))
                                .frame(width: 154, height: 154, alignment: Alignment.center)
                            
                            KFImage(URL(string: usersViewModel.user?.avatarUrl ?? "placeholder"))
                                .placeholder{
                                    GrayCircle()
                                }
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150, alignment: Alignment.center)
                        }
                        .padding(.top, 30)
                        .frame(
                              minWidth: 0,
                              maxWidth: .infinity,
                              minHeight: 0,
                              maxHeight: .infinity,
                              alignment: .center
                            )
                        
                        Text(getValueOrNoData(value: usersViewModel.user?.name))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.top, 20)
                        
                        Text(getValueOrNoData(value: usersViewModel.user?.id))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 20)
                        
                        HStack {
                            VStack (alignment: .leading){
                                Text("Bio :")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                
                                Text(getValueOrNoData(value: usersViewModel.user?.bio))
                                    .foregroundColor(Color.white)
                                    .padding(.top, 10)
                            }
                            Spacer()
                        }
                        .padding(.all, 10)
                        .frame(
                            minWidth: 0,
                              maxWidth: .infinity,
                              alignment: .center
                        )
                        .background (
                            Rectangle()
                                .fill(Color.init(red: 255, green: 255, blue: 255, opacity: 0.0))
                                .addBorder(Color.white, width: 1, cornerRadius: 20)
                        )
                        .padding(.bottom, 10)
                        
                        HStack{
                            VStack (alignment: .leading) {
                                Text("Details :")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.bottom, 5)
                                
                                LabelValueItem(label: "Email", value: usersViewModel.user?.email)
                                
                                LabelValueItem(label: "Company", value: usersViewModel.user?.company)
                                
                                LabelValueItem(label: "Followers", value: getValueOrNoData(value: usersViewModel.user?.followers))
                                
                                LabelValueItem(label: "Following", value: getValueOrNoData(value: usersViewModel.user?.following))
                                
                                LabelValueItem(label: "Public Repos", value: getValueOrNoData(value: usersViewModel.user?.publicRepos))
                                
                                LabelValueItem(label: "Public Gists", value: getValueOrNoData(value: usersViewModel.user?.publicGists))
                                
                                LabelValueItem(label: "Location", value: usersViewModel.user?.location)
                                
                                LabelValueItem(label: "Twitter", value: usersViewModel.user?.twitterUsername)
                                    .padding(.bottom, 5)
                            }
                            Spacer()
                        }
                        .padding(.all, 10)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            alignment: .center
                        )
                        .background (
                            Rectangle()
                                .fill(Color.init(red: 255, green: 255, blue: 255, opacity: 0.0))
                                .addBorder(Color.white, width: 1, cornerRadius: 20)
                        )
                    }
                }
                .padding(.all, 10)
            }
        }
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
        .onAppear(){
            usersViewModel.getUser(username: login)
        }
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
