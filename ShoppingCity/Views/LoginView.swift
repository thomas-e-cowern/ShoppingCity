//
//  LoginView.swift
//  ShoppingCity
//
//  Created by Thomas Cowern on 10/28/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
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

            VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
                Button("Login") {
                    print("Login username: \(username)")
                    print("Login password: \(password)")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .padding()
            .centerHorizontally()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
