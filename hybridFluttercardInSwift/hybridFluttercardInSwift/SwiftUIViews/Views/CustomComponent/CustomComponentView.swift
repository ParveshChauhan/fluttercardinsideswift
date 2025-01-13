//
//  CustomComponentView.swift
//  WeatherAppSwiftUI
//
//  Created by Parvesh Chauhan on 06/01/25.
//

import SwiftUI

struct CustomComponentView: View {
    // State variables for components
    @State private var isSwitchOn: Bool = false
    @State private var isChecked: Bool = false
    @State private var stepperValue: Int = 0
    @State private var sliderValue: Double = 0.5
    @State private var selectedOption: String = "Option 1"
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Switch Button (Toggle)
            HStack {
                Text("Switch:")
                Spacer()
                Toggle(isOn: $isSwitchOn) {
                    Text(isSwitchOn ? "ON" : "OFF")
                        .foregroundColor(isSwitchOn ? .green : .red)
                }
                .labelsHidden() // Hides the default Toggle label
            }
            
            // Checkbox
            HStack {
                Button(action: {
                    isChecked.toggle()
                }) {
                    HStack {
                        Image(systemName: isChecked ? "checkmark.square" : "square")
                        Text("Checkbox")
                    }
                }
                Spacer()
            }
            
            // Stepper
            HStack {
                Text("Stepper: \(stepperValue)")
                Spacer()
                Stepper("", value: $stepperValue, in: 0...10)
            }
            
            // Slider
            VStack(alignment: .leading) {
                Text("Slider: \(String(format: "%.2f", sliderValue))")
                Slider(value: $sliderValue, in: 0...1, step: 0.1)
            }
            
            // Picker
            VStack(alignment: .leading) {
                Text("Picker:")
                Picker("Options", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Spacer()
        }
        .vwoTagScreenName(screenName: "Custom Component")
        .padding()
        .navigationTitle("Custom Components")
    }
}

struct CustomComponentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComponentView()
        }
    }
}
