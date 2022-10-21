//
//  NumberFormatter+Extensions.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
