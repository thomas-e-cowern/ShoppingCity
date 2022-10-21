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
        HStack {
            AsyncImage(url: URL(string: product.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                } else if phase.error != nil {
                    Image("NoImage")
                        .resizable()
                        .frame(width: 100, height: 100)
                } else {
                    EmptyView()
                }
            }
            .padding()
            
            VStack(alignment: .trailing) {
                Text(product.title)
                Text(product.price as NSNumber, formatter: NumberFormatter.currency)
            }
        }
    }
}

//struct ProductRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRowView(product: )
//    }
//}
