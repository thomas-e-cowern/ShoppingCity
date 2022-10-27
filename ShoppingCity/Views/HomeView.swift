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
                
                List(model.homeViewProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductRowView(product: product)
                    }
                }
            }
            .task {
                await getHomeViewProducts()
            }
        .padding()
        }
    }
    
    private func getHomeViewProducts() async {
        print("Inside")
        do {
            try await model.getHomeViewProducts()
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
