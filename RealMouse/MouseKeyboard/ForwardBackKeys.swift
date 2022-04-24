//
//  ForwardBackKeys.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import Foundation

class ForwardBackKeys {
    
    // TODO: need to add an error here for the key codes not being found
    
    private static let forwardMouseButton: Int64 = 4
    private static let backMouseButton: Int64 = 3
    private static let leftBracketKey = CGKeyCode(character: "[")!
    private static let rightBracketKey = CGKeyCode(character: "]")!
    
    static let callback: CGEventTapCallBack = { (proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon) in        
        let mouseButtonNumber = event.getIntegerValueField(.mouseEventButtonNumber)
        
        if UserPreferences.shared.enableForwardBackButtons {
            if (!UserPreferences.shared.switchForwardBackButtons && mouseButtonNumber == forwardMouseButton) ||
                (UserPreferences.shared.switchForwardBackButtons && mouseButtonNumber == backMouseButton) {
                if let eventSource = CGEventSource(stateID: CGEventSourceStateID.hidSystemState),
                   let bracketDown = CGEvent(keyboardEventSource: nil, virtualKey: ForwardBackKeys.rightBracketKey, keyDown: true),
                   let bracketUp = CGEvent(keyboardEventSource: nil, virtualKey: ForwardBackKeys.rightBracketKey, keyDown: false) {
                    let location = CGEventTapLocation.cghidEventTap
                    bracketDown.flags = CGEventFlags.maskCommand
                    bracketDown.post(tap: location)
                    bracketUp.post(tap: location)
                } else {
                    print("Unable to use forward mouse button")
                }
            } else if (!UserPreferences.shared.switchForwardBackButtons && mouseButtonNumber == backMouseButton) ||
                        (UserPreferences.shared.switchForwardBackButtons && mouseButtonNumber == forwardMouseButton) {
                if let eventSource = CGEventSource(stateID: CGEventSourceStateID.hidSystemState),
                   let bracketDown = CGEvent(keyboardEventSource: nil, virtualKey: ForwardBackKeys.leftBracketKey, keyDown: true),
                   let bracketUp = CGEvent(keyboardEventSource: nil, virtualKey: ForwardBackKeys.leftBracketKey, keyDown: false) {
                    let location = CGEventTapLocation.cghidEventTap
                    bracketDown.flags = CGEventFlags.maskCommand
                    bracketDown.post(tap: location)
                    bracketUp.post(tap: location)
                } else {
                    print("Unable to use back mouse button")
                }
            }
        }
        
        return Unmanaged.passRetained(event)
    }
}
