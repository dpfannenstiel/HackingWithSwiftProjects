//
//  AnimationStack.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        .animation(.default, value: enabled)
//        .animation(nil, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
