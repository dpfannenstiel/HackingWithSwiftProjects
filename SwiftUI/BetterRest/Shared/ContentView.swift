//
//  ContentView.swift
//  Shared
//
//  Created by Dustin Pfannenstiel on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0

    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//            DatePicker(
//                "Please enter a date",
//                selection: $wakeUp,
//                displayedComponents: .hourAndMinute
//            )
//            .labelsHidden()
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
