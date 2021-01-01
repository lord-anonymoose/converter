//
//  ContentView.swift
//  converter
//
//  Created by Philipp on 25.12.2020.
//

import SwiftUI

struct temperatureView: View {
    let scales = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputScale = 0
    @State private var outputScale = 0
    @State private var inputAmount = ""
    
    var outputAmount: Double {
        let startScale = scales[inputScale]
        let endScale = scales[outputScale]
        let amount = Double(inputAmount) ?? 0
        var result: Double = 0.0
        
        if (startScale == "Celsius" && endScale == "Fahrenheit") {
            result = (amount * 9 / 5) + 32
        } else if (startScale == "Celsius" && endScale == "Kelvin") {
            result = amount + 273.15
        } else if (startScale == "Fahrenheit" && endScale == "Celsius") {
            result = (amount - 32) * 5 / 9
        } else if (startScale == "Fahrenheit" && endScale == "Kelvin") {
            result = ((amount - 32) * 5 / 9) - 273.15
        } else if (startScale == "Kelvin" && endScale == "Celsius") {
            result = amount - 273.15
        } else if (startScale == "Kelvin" && endScale == "Fahrenheit") {
            result = 9 / 5 * (amount - 273.15) + 32
        } else {
            result = amount
        }
        return result
    }
    
    var body: some View {
          NavigationView {
              Form {
                  Section(header: Text("From:")) {
                      TextField("Amount", text: $inputAmount)
                          .keyboardType(.decimalPad)
                      Picker ("Input scale: ", selection: $inputScale) {
                          ForEach (0..<scales.count) {
                              Text("\(scales[$0])")
                          }
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }
                  
                  Section(header: Text("To:")) {
                      Picker ("Output scale: ", selection: $outputScale) {
                          ForEach (0..<scales.count) {
                              Text("\(scales[$0])")
                          }
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }
                  
                  Section(header: Text("Result:")) {
                      Text("\(outputAmount, specifier: "%.2f")")
                  }
              }
              
              
              
                  .navigationTitle("Temperature")
          }
      }
  }



struct distanceView: View {
    let scales = ["meters", "kilometers", "feet", "yards", "miles"]
    @State private var inputScale = 0
    @State private var outputScale = 0
    @State private var inputAmount = ""
    
    var outputAmount: Double {
        let startScale = scales[inputScale]
        let endScale = scales[outputScale]
        let amount = Double(inputAmount) ?? 0
        var result: Double = 0.0
        if (startScale == "meters"  && endScale == "kilometers") {
            result = amount / 1000
        } else if (startScale == "meters" && endScale == "feet") {
            result = amount * 3.28
        } else if (startScale == "meters" && endScale == "yards") {
            result = amount * 1.09
        } else if (startScale == "meters" && endScale == "miles") {
            result = amount * 0.62 / 1000
        } else if (startScale == "kilometers" && endScale == "meters") {
            result = amount * 1000
        } else if (startScale == "kilometers" && endScale == "feet") {
            result = amount * 3.28 * 1000
        } else if (startScale == "kilometers" && endScale == "yards") {
            result = result * 1.09 * 1000
        } else if (startScale == "kilometers" && endScale == "miles") {
            result = amount * 0.62
        } else if (startScale == "feet" && endScale == "meters") {
            result = amount * 1000
        } else if (startScale == "feet" && endScale == "kilometers") {
            result = amount / 3280.84
        } else if (startScale == "feet" && endScale == "yards") {
            result = amount / 3
        } else if (startScale == "feet" && endScale == "miles") {
            result = amount / 5280
        } else if (startScale == "yards" && endScale == "meters") {
            result = amount * 1000
        } else if (startScale == "yards" && endScale == "kilometers") {
            result = amount / 1090
        } else if (startScale == "yards" && endScale == "feet") {
            result = amount * 3
        } else if (startScale == "yards" && endScale == "miles") {
            result = amount / 1760
        } else if (startScale == "miles" && endScale == "meters") {
            result = amount * 1609.34
        } else if (startScale == "miles" && endScale == "kilometers") {
            result = amount * 1.60934
        } else if (startScale == "miles" && endScale == "feet") {
            result = amount * 5280
        } else if (startScale == "miles" && endScale == "yards") {
            result = amount * 1760
        } else {
            result = amount
        }
        return result

    }
    var body: some View {
          NavigationView {
              Form {
                  Section(header: Text("From:")) {
                      TextField("Amount", text: $inputAmount)
                          .keyboardType(.decimalPad)
                      Picker ("Input scale: ", selection: $inputScale) {
                          ForEach (0..<scales.count) {
                              Text("\(scales[$0])")
                          }
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }
                  
                  Section(header: Text("To:")) {
                      Picker ("Output scale: ", selection: $outputScale) {
                          ForEach (0..<scales.count) {
                              Text("\(scales[$0])")
                          }
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }
                  
                  Section(header: Text("Result:")) {
                      Text("\(outputAmount, specifier: "%.4f")")
                  }
              }
              
              
              
                  .navigationTitle("Distance")
          }
      }
}



struct timeView: View {
    let scales = ["seconds", "minutes", "hours", "days"]
    @State private var inputScale = 0
    @State private var outputScale = 0
    @State private var inputAmount = ""
    
    var outputAmount: Double {
        let startScale = scales[inputScale]
        let endScale = scales[outputScale]
        let amount = Double(inputAmount) ?? 0
        var result: Double = 0.0
        if (startScale == "seconds" && endScale == "minutes") {
            result = amount / 60
        } else if (startScale == "seconds" && endScale == "hours") {
            result = amount / (60*60)
        } else if (startScale == "seconds" && endScale == "days") {
            result = amount / (60*60*24)
        } else if (startScale == "minutes" && endScale == "seconds") {
            result = amount * 60
        } else if (startScale == "minutes" && endScale == "hours") {
            result = amount / 60
        } else if (startScale == "minutes" && endScale == "days") {
            result = amount / (60*24)
        } else if (startScale == "hours" && endScale == "seconds") {
            result = amount * 60 * 60
        } else if (startScale == "hours" && endScale == "minutes") {
            result = amount * 60
        } else if (startScale == "hours" && endScale == "days") {
            result = amount / 24
        } else if (startScale == "days" && endScale == "seconds") {
            result = amount * 24 * 60 * 60
        } else if (startScale == "days" && endScale == "minutes") {
            result = amount * 24 * 60
        } else if (startScale == "days" && endScale == "hours") {
            result = amount * 24
        }
        return result
    }
    var body: some View {
          NavigationView {
              Form {
                  Section(header: Text("From:")) {
                      TextField("Amount", text: $inputAmount)
                          .keyboardType(.decimalPad)
                      Picker ("Input scale: ", selection: $inputScale) {
                          ForEach (0..<scales.count) {
                              Text("\(scales[$0])")
                          }
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }
                  
                  Section(header: Text("To:")) {
                      Picker ("Output scale: ", selection: $outputScale) {
                          ForEach (0..<scales.count) {
                              Text("\(scales[$0])")
                          }
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }
                  
                  Section(header: Text("Result:")) {
                      Text("\(outputAmount, specifier: "%.4f")")
                  }
              }
              
              
              
                  .navigationTitle("Time")
          }
      }
}


struct ContentView: View {
    let modes = ["temperature", "distance", "time"]
    @State private var currentMode = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                if (currentMode == 0) {
                    temperatureView()
                } else if (currentMode == 1) {
                    distanceView()
                } else if (currentMode == 2) {
                    timeView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker ("Select mode: ", selection: $currentMode) {
                        ForEach (0..<modes.count) {
                            Text(self.modes[$0])
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
