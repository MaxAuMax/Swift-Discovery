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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
