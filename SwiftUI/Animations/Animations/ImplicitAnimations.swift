//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
//        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
    }
}
