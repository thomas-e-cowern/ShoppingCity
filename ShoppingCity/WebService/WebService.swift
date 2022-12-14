//
//  WebService.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import Foundation

enum NetworkErrors: Error {
    case badUrl
    case badRequest
    case decodingError
}

class WebService {
    
    // All products url: https://fakestoreapi.com/products
    
    func getAllProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("Bad URL")
            throw NetworkErrors.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkErrors.decodingError
        }
        
        return products
        
    }
    
    func getHomeViewProducts() async throws -> [Product] {

        guard let url = URL(string: "https://fakestoreapi.com/products?limit=3") else {
            print("Bad URL")
            throw NetworkErrors.badUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.badRequest
        }
        
        guard let homeProducts = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkErrors.decodingError
        }

        return homeProducts
    }
    
    func getCategories() async throws -> [String] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else {
            print("Bad URL")
            throw NetworkErrors.badUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.badRequest
        }
        
        guard let categories = try? JSONDecoder().decode([String].self, from: data) else {
            throw NetworkErrors.decodingError
        }
        
        return categories
    }
    
    func getSpecificCategory(category: String) async throws -> [Product] {
        
        var category = category
        
        if category == "men's clothing" {
            category =  "men's%20clothing"
        }
        
        if category == "women's clothing" {
            category =  "women's%20clothing"
        }
        
        guard let url = URL(string: "https://fakestoreapi.com/products/category/\(category)") else {
            print("Bad URL")
            throw NetworkErrors.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.badRequest
        }
        
        guard let catetoryProducts = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkErrors.decodingError
        }
        
        return catetoryProducts
    }
    
    func getRandomProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("Bad URL")
            throw NetworkErrors.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.badRequest
        }
        
        guard var randomProducts = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkErrors.decodingError
        }
        
        var randomProductsSelected: [Product] = []

        for _ in 1...3 {
            let randomInt = Int.random(in: 1..<randomProducts.count)
            randomProductsSelected.append(randomProducts[randomInt])
            randomProducts.remove(at: randomInt)
        }
        
        return randomProductsSelected
        
    }
}
