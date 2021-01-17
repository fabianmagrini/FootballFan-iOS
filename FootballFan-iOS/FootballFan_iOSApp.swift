//
//  FootballFan_iOSApp.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 24/12/20.
//

import SwiftUI

@main
struct FootballFan_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    PostsView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Posts")
                }
            }
        }
    }
}
