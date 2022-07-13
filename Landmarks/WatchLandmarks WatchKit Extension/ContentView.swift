//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Maxime Mallet on 12/07/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
