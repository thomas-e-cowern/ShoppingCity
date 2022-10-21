//
//  ProductRowView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import SwiftUI

struct ProductRowView: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            Text(product.title)
            Text(product.price as NSNumber, formatter: NumberFormatter.currency)
        }
    }
}

//struct ProductRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRowView(product: )
//    }
//}
