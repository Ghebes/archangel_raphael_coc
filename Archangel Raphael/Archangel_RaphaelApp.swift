//
//  Archangel_RaphaelApp.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/22/24.
//

import SwiftUI

@main
struct Archangel_RaphaelApp: App {
    @AppStorage("isLight") var isLight: Bool = true
    @AppStorage("onlyWifi") var onlyWifi:Bool = false
    var body: some Scene {
        WindowGroup {
            TabNavigation()
        }
    }
}
