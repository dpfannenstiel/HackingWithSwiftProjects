//
//  ContentView.swift
//  Shared
//
//  Created by Dustin Pfannenstiel on 3/6/22.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
            .titleStyle()
    }

    var motto2: some View {
        Text("nunquam titillandus")
            .titleStyle()
    }

    @ViewBuilder var spells: some View {
        motto1
        motto2
    }

    var body: some View {
        ZStack {
            Color.red
            VStack(spacing: 10) {
                spells
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
