//
//  Preferences.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import Foundation

class UserPreferences: ObservableObject {
    
    static let shared = UserPreferences()
    
    private init() {
        UserPreferences.register()
        
        mouseMode = MouseMode(rawValue: UserDefaults.standard.integer(forKey: UserPreferences.mouseModeKey))!
        automaticallySwitch = UserDefaults.standard.bool(forKey: UserPreferences.automaticallySwitchKey)
        switchForwardBackButtons = UserDefaults.standard.bool(forKey: UserPreferences.switchForwardBackButtonsKey)
        reverseMouseScrollDirection = UserDefaults.standard.bool(forKey: UserPreferences.reverseMouseScrollDirectionKey)
        enableForwardBackButtons = UserDefaults.standard.bool(forKey: UserPreferences.enableForwardBackButtonsKey)
        trackpadMouseAcceleration = UserDefaults.standard.integer(forKey: UserPreferences.trackpadMouseAccelerationKey)
        mouseMouseAcceleration = UserDefaults.standard.integer(forKey: UserPreferences.mouseMouseAccelerationKey)
        disableMouseAcceleration = UserDefaults.standard.bool(forKey: UserPreferences.disableMouseAccelerationKey)
        disableScrollingAcceleration = UserDefaults.standard.bool(forKey: UserPreferences.disableScrollingAccelerationKey)
    }
    
    private static func register() {
        UserDefaults.standard.register(defaults: [UserPreferences.mouseModeKey: MouseMode.mouse.rawValue,
                                                  UserPreferences.automaticallySwitchKey: false,
                                                  UserPreferences.switchForwardBackButtonsKey: false,
                                                  UserPreferences.reverseMouseScrollDirectionKey: false,
                                                  UserPreferences.enableForwardBackButtonsKey: false,
                                                  UserPreferences.trackpadMouseAccelerationKey: 1,
                                                  UserPreferences.mouseMouseAccelerationKey: -1,
                                                  UserPreferences.disableMouseAccelerationKey: false,
                                                  UserPreferences.disableScrollingAccelerationKey: false])
    }
    
    static let mouseModeKey = "mouseModeKey"
    @Published var mouseMode: MouseMode {
        willSet {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserPreferences.mouseModeKey)
        }
        didSet {
            MouseAcceleration.update()
        }
    }
    
    static let automaticallySwitchKey = "automaticallySwitchKey"
    @Published var automaticallySwitch: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.automaticallySwitchKey)
        }
    }
    
    static let switchForwardBackButtonsKey = "switchForwardBackButtonsKey"
    @Published var switchForwardBackButtons: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.switchForwardBackButtonsKey)
        }
    }
    
    static let reverseMouseScrollDirectionKey = "reverseMouseScrollDirectionKey"
    @Published var reverseMouseScrollDirection: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.reverseMouseScrollDirectionKey)
        }
    }
    
    static let enableForwardBackButtonsKey = "enableForwardBackButtonsKey"
    @Published var enableForwardBackButtons: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.enableForwardBackButtonsKey)
        }
    }
    
    static let trackpadMouseAccelerationKey = "trackpadMouseAccelerationKey"
    @Published var trackpadMouseAcceleration: Int {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.trackpadMouseAccelerationKey)
        }
        didSet {
            if mouseMode == .trackpad {
                MouseAcceleration.update(force: true)
            }
        }
    }
    
    static let mouseMouseAccelerationKey = "mouseMouseAccelerationKey"
    @Published var mouseMouseAcceleration: Int {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.mouseMouseAccelerationKey)
        }
        didSet {
            if mouseMode == .mouse {
                MouseAcceleration.update(force: true)
            }
        }
    }
    
    static let disableMouseAccelerationKey = "disableMouseAccelerationKey"
    @Published var disableMouseAcceleration: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.disableMouseAccelerationKey)
        }
    }
    
    static let disableScrollingAccelerationKey = "disableScrollingAccelerationKey"
    @Published var disableScrollingAcceleration: Bool {
        willSet {
            UserDefaults.standard.set(newValue, forKey: UserPreferences.disableScrollingAccelerationKey)
        }
    }
}
