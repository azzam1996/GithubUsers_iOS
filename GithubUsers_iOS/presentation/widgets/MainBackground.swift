//
//  MainBackground.swift
//  GithubUsers_iOS
//
//  Created by Azzam Habib on 11/12/23.
//

import SwiftUI

struct MainBackground: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient.init(colors: [
                                                Color.init("eminence"),
                                                Color.init("valentino"),
                                                Color.init("valentino_1")]
                    ),
                    startPoint: UnitPoint.bottom,
                    endPoint: UnitPoint.top)
            )
            .edgesIgnoringSafeArea(.top)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct MainBackground_Previews: PreviewProvider {
    static var previews: some View {
        MainBackground()
    }
}
