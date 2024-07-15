//
//  WelcomeScreen.swift
//  ExpenseTracker
//
//  Created by Kumar, Govinda on 30/06/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        @State var username: String = ""
        @State var password: String = ""
//        @Binding var password: String
        ZStack{
            Image("AppBG")
                .resizable()
//                .ignoresSafeArea()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
                
            VStack{
                
                TextField("Username", text: $username)
                    .disableAutocorrection(true)
                    .font(.title2)
                    .fontDesign(.serif)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .headerProminence(.standard)
                    .shadow(color:.black,radius: 50)
                    .background(Color.gray)
//                    .shadow(color:.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .cornerRadius(5)
                    .padding()
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .font(.title2)
                    .fontDesign(.serif)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .headerProminence(.standard)
                    .shadow(color:.black,radius: 50)
                    .background(Color.gray)
//                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .cornerRadius(5)
                    .padding()
            }
            .padding()
//            .background(Color.white.opacity(0.8))
//            .cornerRadius(15)
//            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
//            .padding()
        }
    }
}

#Preview {
    WelcomeScreen()
}
