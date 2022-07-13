//
//  CreatingAndCombiningViewsApp.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Maxime Mallet on 12/07/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

@main
struct CreatingAndCombiningViewsApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
