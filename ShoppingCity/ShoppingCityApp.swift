//
//  ShoppingCityApp.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/21/22.
//

import SwiftUI

@main
struct ShoppingCityApp: App {
    
    @StateObject private var model: ShoppingCityModel

    init() {
        let webService = WebService()
        _model = StateObject(wrappedValue: ShoppingCityModel(webService: webService))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
