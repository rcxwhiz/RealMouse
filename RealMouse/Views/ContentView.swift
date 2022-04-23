//
//  ContentView.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import SwiftUI
import LaunchAtLogin

struct ContentView: View {
    
    @StateObject var userPreferences = UserPreferences.shared
    
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            Form {
                LaunchAtLogin.Toggle()
                Toggle("Reverse mouse scroll direction", isOn: $userPreferences.reverseMouseScrollDirection)
                Toggle("Enable forward and back mouse buttons", isOn: $userPreferences.enableForwardBackButtons)
                Toggle("Disable mouse acceleration", isOn: $userPreferences.disableMouseAcceleration)
                Toggle("Disable scrolling acceleration", isOn: $userPreferences.disableScrollingAcceleration)
            }
            Spacer()
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
