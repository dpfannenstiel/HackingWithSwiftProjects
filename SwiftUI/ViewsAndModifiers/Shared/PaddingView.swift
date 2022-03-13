//
//  PaddingView.swift
//  ViewsAndModifiers
//
//  Created by Dustin Pfannenstiel on 3/12/22.
//

import SwiftUI

struct PaddingView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct PaddingView_Previews: PreviewProvider {
    static var previews: some View {
        PaddingView()
    }
}
