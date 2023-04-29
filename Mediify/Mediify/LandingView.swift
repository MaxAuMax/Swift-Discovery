//
//  ContentView.swift
//  Mediify
//
//  Created by MaxAuMax on 30/04/2023.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Text("Mediify")
                .font(.system(size: 70))
                .foregroundColor(Color("lightPurple"))
            
            Spacer()
            
            Text("Hi there!")
                .font(.system(size: 25))
                .foregroundColor(Color("darkGray"))
            Text("Welcome to Mediify")
                .font(.system(size: 25))
                .foregroundColor(Color("darkGray"))
            
            Spacer()
            
            Image("Two Doctors")
                .padding(.bottom)
            
            HStack {
                Button("Sign in") {}
                    .cornerRadius(25)
                    .padding(.trailing)
                Button("Log in") {}
                    .cornerRadius(25)
                    .padding(.leading)
            }
            .font(.system(size: 22))
            .buttonStyle(.borderedProminent)
            .tint(Color("lightPurple"))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
