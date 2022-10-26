//
//  ProductDetailView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/26/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    
    var body: some View {
        Text(product.title)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: 1, title: "Test Product", price: 12.99, description: "Test product description", category: "electronics", image: "", rating: Rating(rate: 4.0, count: 4)))
    }
}
