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
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image("house")
                }
            SearchView()
                .tabItem {
                    Text("Search")
                    Image("search")
                }
            CategoryView()
                .tabItem {
                    Text("Categories")
                    Image("options")
                }
            CartView()
                .tabItem {
                    Text("Cart")
                    Image("trolley")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
