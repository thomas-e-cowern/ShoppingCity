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
                Text("Searching for \(searchText)")
                    .searchable(text: $searchText, prompt: "Search our inventory")
                .navigationTitle("Search for Products!")
            }
            .task {
                await getHomeViewProducts()
            }
        }
    }
    
    private func getHomeViewProducts() async {

        do {
            try await model.getHomeViewProducts()
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
