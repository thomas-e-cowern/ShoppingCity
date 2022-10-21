//
//  ContentView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: ShoppingCityModel
    
    var body: some View {
        VStack {
            List(model.products) { product in
                Text(product.title)
            }
        }
        .padding()
        .task {
            await getProducts()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
