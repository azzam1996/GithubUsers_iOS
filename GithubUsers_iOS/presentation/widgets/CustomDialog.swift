//
//  CustomDialog.swift
//  iosApp
//
//  Created by Azzam Habib on 2/13/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct CustomDialog<DialogContent: View>: ViewModifier {
  var isShowing: Bool // set this to show/hide the dialog
  let dialogContent: DialogContent

  init(isShowing: Bool,
        @ViewBuilder dialogContent: () -> DialogContent) {
    self.isShowing = isShowing
     self.dialogContent = dialogContent()
  }

  func body(content: Content) -> some View {
   // wrap the view being modified in a ZStack and render dialog on top of it
    ZStack {
      content
      if isShowing {
        // the semi-transparent overlay
        Rectangle().foregroundColor(Color.black.opacity(0.6))
        // the dialog content is in a ZStack to pad it from the edges
        // of the screen
        ZStack {
          dialogContent
        }
        .padding(40)
      }
    }
  }
}
