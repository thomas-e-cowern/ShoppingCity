//
//  Product.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    
}

struct Rating: Codable, Hashable {
    
    var rate: Double
    var count: Int
    
}
