//
//  CurrencyConverterModel.swift
//  iOS4-Marth
//
//  Created by Natalia Marth on 13.12.23.
//

import Foundation

struct CurrencyConverterModel {
    
    var usdRate = 1.0787
    var gbpRate = 0.8612
    
    var valueEuro = 0.0
    
    
    var valueUSD: Double {
        get {
            valueEuro * usdRate
        }
        set {
            valueEuro = newValue / usdRate
        }
    }
    
    var valueGBP: Double {
        get {
            valueEuro * gbpRate
        }
        set {
            valueEuro = newValue / gbpRate
        }
    }
}
