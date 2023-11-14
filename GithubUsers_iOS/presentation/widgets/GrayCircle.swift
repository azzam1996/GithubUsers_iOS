//
//  GrayCircle.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/11/23.
//

import SwiftUI

struct GrayCircle: View {
    var body: some View {
        ZStack{
            Circle().fill(Color.init("eminence"))
            ProgressView()
                .scaleEffect(1.2)
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                .frame(width: 100,height: 100)
        }
    }
}

struct GrayCircle_Previews: PreviewProvider {
    static var previews: some View {
        GrayCircle()
    }
}
