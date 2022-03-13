//
//  Transitions.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct Transitions: View {
    @State private var isShowingRed = false


    @ViewBuilder private var asymmetricTransition: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition( // scale works when tested in app
                        .asymmetric(insertion: .scale, removal: .opacity)
                    )
            }
        }
    }

    @ViewBuilder private var customTransition: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot) // also only works in app
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }

    var body: some View {
        customTransition
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
