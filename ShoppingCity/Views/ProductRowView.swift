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
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                case .failure(_):
                    Text("No Image Available")
                @unknown default:
                    EmptyView()
                }
            }
            .padding()
            
            VStack(alignment: .trailing) {
                Text(product.title)
                    .font(.footnote)
                Text(product.price as NSNumber, formatter: NumberFormatter.currency)
                    .font(.callout)
            }
        }
    }
}

//struct ProductRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRowView(product: )
//    }
//}
