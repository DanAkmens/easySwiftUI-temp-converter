//
//  ContentView.swift
//  temperature-conversion
//
//  Created by Dainis Putans on 02/02/2024.
//

import SwiftUI

struct ContentView: View {

    var sectionName = "Enter your temperature"
    var outsideCelsium = "Choose your input"

    var toggleBetween = ["Fahrenheit", "Celsium"]

    @State private var temperatureOutside = 0

    @State private var selectedConverter = "Celsium"

    private var switchOutput: String {
        if selectedConverter == "Celsium" {
            return "Fahrenheit"
        } else {
            return "Celsium"
        }
    }

    var convertedTemp: Double {
        if selectedConverter == "Fahrenheit" {
            let userTemperature = Double(temperatureOutside)
            let userCelsium = (userTemperature - 32) * 5 / 9
            
            return userCelsium
        }
        else {
            let userTemperature = Double(temperatureOutside)
            let userFahrenheit = (userTemperature * 9 / 5) + 32
            
            return userFahrenheit
        }
    }
    
        var body: some View {
            NavigationStack {
                Form {
                    Section(sectionName) {
                        TextField("Temperature", value: $temperatureOutside, format: .number)
                            .keyboardType(.decimalPad)
                        
                    }

                    Section(outsideCelsium) {
                        Picker("Celsium or Fahrenheit", selection: $selectedConverter) {
                            ForEach(toggleBetween, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.navigationLink)
                    }

                    Section("The temperature in \(selectedConverter)") {
                        Text("The temperature is: \(String(format: "%.1f", convertedTemp)) in \(switchOutput)")
                    }

                }.navigationTitle("Temperature Conversion")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

#Preview {
    ContentView()
}
