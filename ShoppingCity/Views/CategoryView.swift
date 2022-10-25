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
        VStack {
            List(model.categories, id: \.self) { category in
                Text(category)
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
    }
}
