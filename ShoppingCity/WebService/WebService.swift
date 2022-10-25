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
}
