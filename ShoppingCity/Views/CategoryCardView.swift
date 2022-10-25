//
//  CategoryCardView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/25/22.
//

import SwiftUI

struct CategoryCardView: View {
    
    var category: String
    
    var body: some View {
        VStack(alignment: .center){
            Text(category)
                .padding()
                .border(.red)
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: "entertainment")
    }
}
