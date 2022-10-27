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
            
            if searchResults.isEmpty && !searchText.isEmpty {
                Text("Sorry, we couldn't find what your are looking for").centerHorizontally()
                    .padding()
            } else {
                VStack {
                    List(searchResults) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductRowView(product: product)
                                
                        }
                    }
                        .navigationTitle("Search for Products!")
                }
                .task {
                    await getProducts()
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search our inventory")
    }
    
    private func getProducts() async {

        do {
            try await model.getProducts()
        } catch {
            print("ContentView error in getProducts(): \(error.localizedDescription)")
        }
    }
    
    var searchResults: [Product] {
            if searchText.isEmpty {
                return model.products
            } else {
                return model.products.filter { $0.title.contains(searchText) }
            }
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
