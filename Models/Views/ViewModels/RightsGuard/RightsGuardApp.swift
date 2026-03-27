//
//  RightsGuardApp.swift
//  RightsGuard
//
//  Created by Lauren Gonzalez-Perez on 2/27/26.
//

import SwiftUI

@main
struct RightsGuardApp: App {
    @State private var languageSettings = LanguageSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(languageSettings)
        }
    }
}
