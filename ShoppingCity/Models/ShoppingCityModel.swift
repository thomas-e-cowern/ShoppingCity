//
//  ShoppingCityModel.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import Foundation

@MainActor
class ShoppingCityModel: ObservableObject {
    
    let webService: WebService
    @Published private(set) var products: [Product] = []
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func getProducts() async throws {
        products = try await webService.getAllProducts()
    }
    
}
