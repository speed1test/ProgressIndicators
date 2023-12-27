//
//  ContentView.swift
//  ProgressIndicator
//
//  Created by elsalvador on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 10
    @State private var stepperValue: Int = 4
    @State private var progressValue: Double = 0.5

    var body: some View {
        VStack {
            Text("Progress Indicator")
                .font(.title)
                .fontWeight(.bold)

            Slider(value: Binding(
                get: { self.sliderValue },
                set: { newValue in
                    self.sliderValue = newValue
                    self.stepperValue = Int(newValue)
                    self.updateProgress()
                }
            ), in: 1...10)
            .padding(.horizontal)

            ProgressView(value: progressValue)
                .padding(.horizontal)

            Stepper(value: Binding(
                get: { self.stepperValue },
                set: { newValue in
                    self.stepperValue = newValue
                    self.sliderValue = Double(newValue)
                    self.updateProgress()
                }
            ), in: 1...10) {
                Text("Stepper Value: \(stepperValue)")
            }
            .padding(.horizontal, 160.0)

            Button(action: {
                // Reset button action
                self.sliderValue = 5.5 // Set an initial value for the slider
                self.stepperValue = 6 // Set an initial value for the stepper
                self.updateProgress()
            }) {
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .buttonStyle(DefaultButtonStyle())
            .padding(.top, 20.0)
        }
        .padding()
    }

    private func updateProgress() {
        // Update progress based on the current values of slider and stepper
        let normalizedSliderValue = sliderValue / 10
        let normalizedStepperValue = Double(stepperValue) / 10
        progressValue = (normalizedSliderValue + normalizedStepperValue) / 2
    }
}

#Preview {
    ContentView()
}
