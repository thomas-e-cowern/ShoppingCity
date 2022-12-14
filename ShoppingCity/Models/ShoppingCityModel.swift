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
    @Published private(set) var categoryViewProducts: [Product] = []
    @Published private(set) var randomProducts: [Product] = []
    
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
    
    func getCategoryProducts(category: String) async throws {
        categoryViewProducts = try await webService.getSpecificCategory(category: category)
    }
    
    func getRandomProdcuts() async throws {
        randomProducts = try await webService.getRandomProducts()
    }
}
