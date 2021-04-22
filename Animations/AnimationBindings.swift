//
//  AnimationBindings.swift
//  Animations
//
//  Created by Antonio Vega on 4/22/21.
//

import SwiftUI

struct AnimationBindings: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(Animation.easeInOut(duration: 1.5).repeatCount(3)), in: 1...10)
                .padding()

            Spacer()

            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimationBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBindings()
    }
}
