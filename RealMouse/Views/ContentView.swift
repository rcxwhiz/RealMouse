//
//  ContentView.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import SwiftUI
import LaunchAtLogin

struct ContentView: View {
    
    @StateObject var preferences = UserPreferences.shared
    
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            Form {
                Section {
                    LaunchAtLogin.Toggle()
                }
                
                Section {
                    Picker("Current mouse mode", selection: $preferences.mouseMode) {
                        Text("Trackpad").tag(MouseMode.trackpad)
                        Text("Mouse").tag(MouseMode.mouse)
                    }
                    .pickerStyle(.radioGroup)
                    Toggle("Automatically toggle mouse mode when scrolling", isOn: $preferences.automaticallySwitch)
                }
                
                Section {
                    Toggle("Reverse mouse scroll direction", isOn: $preferences.reverseMouseScrollDirection)
                }
                
                Section {
                    Toggle("Enable forward and back mouse buttons", isOn: $preferences.enableForwardBackButtons)
                    Toggle("Switch mouse forward and back buttons", isOn: $preferences.switchForwardBackButtons)
                }
                
                Section {
                    Toggle("Disable scrolling acceleration", isOn: $preferences.disableScrollingAcceleration)
                }
                
                Section {
                    Picker("Trackpad cursor acceleration", selection: $preferences.trackpadMouseAcceleration) {
                        Text("Off").tag(-1)
                        Text("Minor").tag(0)
                        Text("Low").tag(1)
                        Text("Medium").tag(2)
                        Text("High").tag(3)
                    }
                    Picker("Mouse cursor acceleration", selection: $preferences.mouseMouseAcceleration) {
                        Text("Off").tag(-1)
                        Text("Minor").tag(0)
                        Text("Low").tag(1)
                        Text("Medium").tag(2)
                        Text("High").tag(3)
                    }
                }
            }
            Spacer()
        }
        .frame(minWidth: 464)
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
