//
//  ContentView.swift
//  WeSplit
//
//  Created by Jose Flavio Quispe on 22/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var percentages = [5, 10, 15, 20, 25, 0]
    @State private var selectedPercentage = 0
    @State private var selectedIndexOfNumberOfPeople = 0
    
    private var totalPerPerson : Double {
        let peopleCount = Double(selectedIndexOfNumberOfPeople + 2)
        let percentage = Double(percentages[selectedPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount * ( percentage / 100 )
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $selectedIndexOfNumberOfPeople) {
                        ForEach(2 ..< 15) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much percentage of tip d o you want to leave?")) {
                    Picker("Tip percentage", selection: $selectedPercentage) {
                        ForEach(0 ..< percentages.count) {
                            Text("\(self.percentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("Total per person \(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
