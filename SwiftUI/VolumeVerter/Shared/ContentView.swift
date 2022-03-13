//
//  ContentView.swift
//  Shared
//
//  Created by Dustin Pfannenstiel on 3/12/22.
//

import SwiftUI

private let units = [
    "Meters": UnitLength.meters,
    "Kilometers": UnitLength.kilometers,
    "Feet": UnitLength.feet,
    "Yards": UnitLength.yards,
    "Miles": UnitLength.miles
]

private var unitNames: [String] {
    units.keys.sorted()
}

struct ContentView: View {

    @State private var sourceUnits = unitNames.first!
    @State private var targetUnits = unitNames.last!
    @State private var originalValue = 0.0

    var sourceUnit: UnitLength {
        units[sourceUnits]!
    }

    var targetUnit: UnitLength {
        units[targetUnits]!
    }

    var convertedValue: Double {
        let measurement = Measurement(value: originalValue, unit: sourceUnit)
        let conversion = measurement.converted(to: targetUnit)
        return conversion.value
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Convert from", selection: $sourceUnits) {
                        ForEach(unitNames, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Distance in \(sourceUnit.symbol)", value: $originalValue, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Source Distance")
                }
                Section {
                    Picker("Convert to", selection: $targetUnits) {
                        ForEach(unitNames, id: \.self) {
                            Text($0)
                        }
                    }
                    Text(convertedValue, format: .number)
                }
            }
            .navigationTitle(Text("Converter"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
