//
//  RealMouseApp.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import SwiftUI

@main
struct RealMouseApp: App {
    
    private let buttonEnabler = KeyIntercepter.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
