//
//  CategoryView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/25/22.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject private var model: ShoppingCityModel
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationView {
                List(model.categories, id: \.self) { category in
                    NavigationLink(destination: SpecificCategoryView(category: category)) {
                        CategoryCardView(category: category)
                            .centerHorizontally()
                    }
                }
            }
           
        }
        .task {
            await getCategories()
        }
    }
    
    private func getCategories() async {
        do {
            try await model.getCategories()
        } catch {
            print("There was a problem getting categories")
        }
    }
}

struct CategoryVIEW_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
