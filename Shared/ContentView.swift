//
//  ContentView.swift
//  Shared
//
//  Created by Karem on 9/16/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson:Double{
        let peopleCount = Double(numberOfPeople + 2)
        let amount = Double(checkAmount) ?? 0
        let totalAmount = amount + ((Double(tipPercentages[tipPercentage]) * 0.01) * amount)
        return totalAmount / peopleCount
    }
   
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Check Amount", text: $checkAmount).keyboardType(.decimalPad)
                    
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach (2..<100){
                        Text("\($0) people")
                    }
                }
            }
        
            Section(header:Text("How much tip do you want to leave?")){
                
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach (0..<tipPercentages.count){
                        Text("\(self.tipPercentages[$0]) %")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:Text("Amount Per Person")){
                Text("$ \(totalPerPerson)")
            }
            
        }.navigationTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
