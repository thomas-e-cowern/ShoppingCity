//
//  HomeView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var model: ShoppingCityModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Shopping City!")
                    .font(.largeTitle)
                
                Image("online-shopping")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                VStack {
                    Text("Check out some random products!")
                    List(model.randomProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductRowView(product: product)
                        }
                    }
                }
            }
            .task {
                await getRandomProducts()
            }
        .padding()
        }
    }
    
    private func getRandomProducts() async {

        do {
            try await model.getRandomProdcuts()
        } catch {
            print("ContentView error in getProducts(): \(error.localizedDescription)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
