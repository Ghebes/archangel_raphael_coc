//
//  AppNavigation.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/30/24.
//

import SwiftUI

class NavigationValues: ObservableObject {
    /**
     Variable that determines which screen is displayed for the first tab in the navigation tab

        - `0` refers to the HomePage()
        - `1` refers to the BroadcastPage()
    */
    @Published var currentAppScreen: Int = 0
    
    
    
}

struct AppNavigation: View {
    @StateObject var currentScreen = NavigationValues()
    var body: some View {
        if(currentScreen.currentAppScreen == 0){
            HomePage(navigationValues: currentScreen)
        }else if(currentScreen.currentAppScreen == 1){
            BroadcastView(navigationValues: currentScreen)
        }
    }
}

#Preview {
    AppNavigation()
}
