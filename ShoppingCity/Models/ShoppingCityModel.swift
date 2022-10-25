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
    @Published private(set) var homeViewProducts: [Product] = []
    @Published private(set) var categories: [String] = []
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func getProducts() async throws {
        products = try await webService.getAllProducts()
    }
    
    func getHomeViewProducts() async throws {
        homeViewProducts = try await webService.getHomeViewProducts()
    }
    
    func getCategories() async throws {
        categories = try await webService.getCategories()
    }
    
}
