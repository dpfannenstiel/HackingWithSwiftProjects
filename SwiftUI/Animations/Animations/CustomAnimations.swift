//
//  CustomAnimations.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct CustomAnimations: View {
    @State private var animationAmount = 1.0

    @ViewBuilder var button: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
    }

    @ViewBuilder var sampleAnimations: some View {
        button
            .scaleEffect(animationAmount)
//        .animation(.easeInOut(duration: 2), value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 2)
//                .delay(1),
//            value: animationAmount
//        )
//        .animation(
//            .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true),
//            value: animationAmount
//        )
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
    }

    @ViewBuilder var pulsingButton: some View {
        button
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear { // note that .onAppear may be placed in this @ViewBuilder
                        // there is however a bug where if you tap it the animation stops...
                        // no matter this is mostly for sample code purposes
                animationAmount = 2
            }
    }

    var body: some View {
        pulsingButton
    }
}

struct CustomAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimations()
    }
}
