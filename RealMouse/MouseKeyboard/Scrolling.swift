//
//  ScrollDirection.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import Foundation

class Scrolling {
    
    private static let preferences = UserPreferences.shared
    
    static let callback: CGEventTapCallBack = { (proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon) in
        // Update the mouse mode in preferences - this will update mouse acceleration
        if preferences.automaticallySwitch {
            preferences.mouseMode = event.getIntegerValueField(.scrollWheelEventIsContinuous) == 0 ? .mouse : .trackpad
        }
        
        // Need to adjust at least one scroll property
        if preferences.mouseMode == .mouse && (preferences.disableScrollingAcceleration || preferences.reverseMouseScrollDirection) {
            var delta = event.getIntegerValueField(.scrollWheelEventDeltaAxis1)
            
            // Remove scroll scaling
            if preferences.disableScrollingAcceleration {
                delta = delta > 0 ? 3 : -3
            }
            // Change scroll direction
            if preferences.reverseMouseScrollDirection {
                delta = -delta
            }
            
            event.setIntegerValueField(.scrollWheelEventDeltaAxis1, value: delta)
        }
        
        return Unmanaged.passRetained(event)
    }
}
