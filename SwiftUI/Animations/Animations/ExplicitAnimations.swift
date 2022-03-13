//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
//            withAnimation {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
