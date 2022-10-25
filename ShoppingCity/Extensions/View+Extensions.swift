//
//  View+Extensions.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/25/22.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
