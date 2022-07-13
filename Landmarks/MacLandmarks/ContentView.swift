//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Maxime Mallet on 13/07/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
