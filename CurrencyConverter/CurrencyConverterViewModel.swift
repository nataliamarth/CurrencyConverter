//
//  CurrencyConverterViewModel.swift
//  iOS4-Marth
//
//  Created by Natalia Marth on 13.12.23.
//

import Foundation

class CurrencyConverterViewModel: ObservableObject {
    
    @Published private var converter = CurrencyConverterModel()
    
    var gbpRate: Double {
        get {
            converter.gbpRate
        }
    }
    
    var usdRate: Double {
        get {
            converter.usdRate
        }
    }
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    } ()
    
    var amountEuroFormatted: String {
        get {
            return numberFormatter.string(from: NSNumber(value: converter.valueEuro)) ?? ""
        }
        set {
            if let value = Double(newValue) {
                converter.valueEuro = value
            }
        }
    }
    
    var amountUSDFormatted: String {
        get {
            return numberFormatter.string(from: NSNumber(value: converter.valueUSD)) ?? ""
        }
        set {
            if let value = Double(newValue) {
                converter.valueUSD = value
            }
        }
    }
    
    var amountGBPFormatted: String {
        get {
            return numberFormatter.string(from: NSNumber(value: converter.valueGBP)) ?? ""
        }
        set {
            if let value = Double(newValue) {
                converter.valueGBP = value
            }
        }
    }
 
    func downloadExchangeRates() -> Bool {
        guard let url = URL(string: "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml") else {
            print("Invalid URL")
            return true
        }
        
        do {
            let xmlContent = try String(contentsOf: url, encoding: .utf8)
            
            if let usdRateRange = xmlContent.range(of: "\"USD\" rate=\"") {
                let startIndex = xmlContent.index(usdRateRange.upperBound, offsetBy: 0)
                let endIndex = xmlContent.index(startIndex, offsetBy: 6)
                let usdRateString = xmlContent[startIndex..<endIndex]
                
                if let usdRate = Double(usdRateString) {
                    print("USD Rate: \(usdRate)")
                    converter.usdRate = usdRate
                }
            }
            
            if let gbpRateRange = xmlContent.range(of: "\"GBP\" rate=\"") {
                let startIndex = xmlContent.index(gbpRateRange.upperBound, offsetBy: 0)
                let endIndex = xmlContent.index(startIndex, offsetBy: 6)
                let gbpRateString = xmlContent[startIndex..<endIndex]
                
                if let gbpRate = Double(gbpRateString) {
                    print("GBP Rate: \(gbpRate)")
                    converter.gbpRate = gbpRate
                }
            }
        }
        catch {
            print("Error by loading XML Content: \(error)")
        }
        
        return true
    }
    
}
