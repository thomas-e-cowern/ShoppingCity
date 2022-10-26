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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SpecificCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificCategoryView(category: "jewelry")
            .environmentObject(ShoppingCityModel(webService: WebService()))
    }
}
