//
//  ButtonEnabler.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import Foundation

class KeyIntercepter {
    
    static let shared = KeyIntercepter()

    private init() {
        interceptButtons()
    }
    
    private func interceptButtons() {
        let eventTap = CGEvent.tapCreate(tap: .cghidEventTap,
                                     place: .tailAppendEventTap,
                                     options: .defaultTap,
                                     eventsOfInterest: 1 << CGEventType.otherMouseDown.rawValue,
                                     callback: ForwardBackKeys.callback,
                                     userInfo: nil)
        
        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, CFRunLoopMode.commonModes)
        CGEvent.tapEnable(tap: eventTap!, enable: true)
        
        Task {
            CFRunLoopRun()
        }
    }
}
