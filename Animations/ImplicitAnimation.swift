//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by Antonio Vega on 4/22/21.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
