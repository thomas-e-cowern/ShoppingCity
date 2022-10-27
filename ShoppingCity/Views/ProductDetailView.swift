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
        ScrollView {
            VStack {
                Text(product.title)
                    .padding()
                    .font(.title)
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 250, height: 250)
                    case .failure(let fail):
                        Text("Failure: \(fail.localizedDescription)")
                        Image("NoImage")
                            .resizable()
                            .frame(width: 250, height: 250)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding()
                VStack {
                    Text("Price: \(product.price as NSNumber, formatter: NumberFormatter.currency)")
                        .padding()
                        .font(.title)
                    Text("Customer Rating: \(product.rating.rate, specifier: "%.2f")")
                        .font(.subheadline)
                }
                .padding()
                VStack {
                    Text(product.description)
                }
                .padding()
                
                Button("Add To Cart") {
                    // Add to cart
                }
                .padding(.bottom, 50)
            }
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: 1, title: "Test Product", price: 12.99, description: "Test product description", category: "electronics", image: "", rating: Rating(rate: 4.0, count: 4)))
    }
}
