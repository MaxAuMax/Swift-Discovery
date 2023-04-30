//
//  ContentView.swift
//  Mediify
//
//  Created by MaxAuMax on 30/04/2023.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("mediify")
                    .font(.system(size: 70))
                    .foregroundColor(Color("lightPurple"))
                    .padding(.bottom, 0.5)
                
                Text("Hi there!")
                    .font(.system(size: 22))
                    .foregroundColor(Color("darkGray"))
                Text("Welcome to Mediify")
                    .font(.system(size: 22))
                    .foregroundColor(Color("darkGray"))
                
                Spacer()
                
                Image("Two Doctors")
                    .padding([.bottom, .leading])
                
                HStack {
                    NavigationLink {
                        Text("Sign in page")
                    } label: {
                        Text("Sign in")
                    }
                    .cornerRadius(25)
                    .padding(.trailing)

                    NavigationLink {
                        Text("Log in page")
                    } label: {
                        Text("Log in")
                    }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
