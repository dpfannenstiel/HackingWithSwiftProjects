//
//  AnimatingGestures.swift
//  Animations
//
//  Created by Dustin Pfannenstiel on 3/13/22.
//

import SwiftUI

struct AnimatingGestures: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    @ViewBuilder var card: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            dragAmount = .zero
                        }
                    }
            )
    }

    @ViewBuilder var lettersView: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
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

    var body: some View {
        lettersView
    }
}

struct AnimatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures()
    }
}
