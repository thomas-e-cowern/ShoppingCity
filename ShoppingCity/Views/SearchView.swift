//
//  SearchView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/25/22.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var model: ShoppingCityModel
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(model.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductRowView(product: product)
                    }
                }
                    .searchable(text: $searchText, prompt: "Search our inventory")
                    .navigationTitle("Search for Products!")
            }
            .task {
                await getProducts()
            }
        }
    }
    
    private func getProducts() async {

        do {
            try await model.getProducts()
        } catch {
            print("ContentView error in getProducts(): \(error.localizedDescription)")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
