//
//  LoginView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/28/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    
                    Image("store")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 30)
                    
                    Text("to Shopping City")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                }.centerHorizontally()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
