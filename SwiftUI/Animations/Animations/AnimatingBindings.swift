//
//  AnimatingBindings.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0

    var body: some View {
        
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindings()
    }
}
