//
//  CheckoutView.swift
//  iDine
//
//  Created by Rajan Twanabashu on 9/23/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var addloyaltyyDetails = false
    @State private var loyalityNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addloyaltyyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                
                if addloyaltyyDetails {
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                }
                
            }
            Section(header: Text("Add a tip?")) {
                               Picker("Percentage: ", selection: $tipAmount){
                                   ForEach(0..<CheckoutView.self.tipAmounts.count){
                                       Text("\(CheckoutView.self.tipAmounts[$0]) %")
                                   }
                               }.pickerStyle(SegmentedPickerStyle())
                           }
                           
            Section(header: Text("Total: \(self.totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                               Button("Conform Order") {
                                   self.showingPaymentAlert.toggle()
                               }
                           }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
           Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"), dismissButton: .default(Text("OK")))
        }
    }
    
   
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order  = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
