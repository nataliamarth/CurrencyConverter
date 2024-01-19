//
//  ContentView.swift
//  iOS4-Marth
//
//  Created by Natalia Marth on 05.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currencyConverterViewModel = CurrencyConverterViewModel()
    
    var body: some View {
        VStack {
            Text("Currency Converter").font(.title)
            
            HStack {
            Image(systemName: "eurosign.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.blue)
                .padding(.top, 10)
            
            Image(systemName: "dollarsign.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.blue)
                .padding(.top, 10)
            
            Image(systemName: "sterlingsign.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.blue)
                .padding(.top, 10)
            }.font(.title)
            
            HStack {
                Text("Rate € \(Image(systemName: "arrow.right")) $").padding()
                Text("\(currencyConverterViewModel.usdRate)")
                Spacer()
            }
            
            HStack {
                Text("Rate € \(Image(systemName: "arrow.right")) £").padding()
                Text("\(currencyConverterViewModel.gbpRate)")
                Spacer()
            }
            
            HStack {
                TextField("Amount in Euros", text: $currencyConverterViewModel.amountEuroFormatted)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("€")
            }
            .padding()
            
            HStack {
                TextField("USD:", text: $currencyConverterViewModel.amountUSDFormatted)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Text("$")
            }
            .padding()
            
            HStack {
                TextField("GBP:", text: $currencyConverterViewModel.amountGBPFormatted)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Text("£")
            }
            .padding()
            Spacer()
            
            Button("Load current Exchange Rates") {
                let success = currencyConverterViewModel.downloadExchangeRates();
                if success {
                    print("Exchange rates downloaded successfully")
                } else {
                    print("Failed to download exchange rates")
                }
            }
            Text("Source of Online Exchange Rates: European Central Bank")
                .font(.footnote)
                .padding(.top, 8)
        }
        .padding()
    }
}
    
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

    
