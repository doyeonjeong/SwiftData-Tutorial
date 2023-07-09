//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by DOYEON JEONG on 2023/07/06.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
