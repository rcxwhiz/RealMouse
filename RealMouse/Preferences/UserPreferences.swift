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
        
//        runAtLogin = UserDefaults.standard.bool(forKey: UserPreferences.runAtLoginKey)
        reverseMouseScrollDirection = UserDefaults.standard.bool(forKey: UserPreferences.reverseMouseScrollDirectionKey)
        enableForwardBackButtons = UserDefaults.standard.bool(forKey: UserPreferences.enableForwardBackButtonsKey)
        disableMouseAcceleration = UserDefaults.standard.bool(forKey: UserPreferences.disableMouseAccelerationKey)
        disableScrollingAcceleration = UserDefaults.standard.bool(forKey: UserPreferences.disableScrollingAccelerationKey)
    }
    
    private static func register() {
        UserDefaults.standard.register(defaults: [UserPreferences.reverseMouseScrollDirectionKey: false,
                                                  UserPreferences.enableForwardBackButtonsKey: false,
                                                  UserPreferences.disableMouseAccelerationKey: false,
                                                  UserPreferences.disableScrollingAccelerationKey: false])
    }
    
//    private static let runAtLoginKey = "runAtLoginKey"
//    @Published var runAtLogin: Bool {
//        willSet {
//            UserDefaults.standard.set(newValue, forKey: UserPreferences.runAtLoginKey)
//        }
//    }
    
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
