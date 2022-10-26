//
//  SpecificCategoryView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/26/22.
//

import SwiftUI

struct SpecificCategoryView: View {
    
    @EnvironmentObject private var model: ShoppingCityModel
    var category: String
    
    var body: some View {
        VStack {
            List(model.categoryViewProducts) { product in
                ProductRowView(product: product)
            }
        }
        .task {
            await getSpecificCategoryProducts(category: category)
        }
    }
    
    private func getSpecificCategoryProducts(category: String) async {
        do {
            try await model.getCategoryProducts(category: category)
        } catch {
            print("There was a problem getting category products: \(error.localizedDescription)")
        }
    }
}

struct SpecificCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificCategoryView(category: "jewelry")
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
