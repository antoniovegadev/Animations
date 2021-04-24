//
//  DragCard.swift
//  Animations
//
//  Created by Antonio Vega on 4/23/21.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: 90, anchor: .bottomLeading), identity: CornerRotateModifier(amount: 0, anchor: .bottomLeading))
    }
}

struct DragCard: View {
    let handle = Array("@tonivegaochoa")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State private var isShowing = false

    var body: some View {
        VStack {
            Spacer()
            
            Button("Tap Me") {
                withAnimation {
                    isShowing.toggle()
                }
            }
            
            if isShowing {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
            }
            
            Spacer()
            
            HStack(spacing: 0) {
                ForEach(0..<handle.count) { num in
                    Text(String(handle[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? Color.blue : Color.red)
                        .offset(dragAmount)
                        .animation(Animation.default.delay(Double(num)/20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
        )
        }
    }
}

struct DragCard_Previews: PreviewProvider {
    static var previews: some View {
        DragCard()
    }
}
