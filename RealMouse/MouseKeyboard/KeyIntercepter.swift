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
        let otherMouseButtonsTap = CGEvent.tapCreate(tap: .cghidEventTap,
                                     place: .tailAppendEventTap,
                                     options: .listenOnly,
                                     eventsOfInterest: 1 << CGEventType.otherMouseDown.rawValue,
                                     callback: ForwardBackKeys.callback,
                                     userInfo: nil)
        let otherMouseButtonsRunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, otherMouseButtonsTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), otherMouseButtonsRunLoopSource, CFRunLoopMode.commonModes)
        CGEvent.tapEnable(tap: otherMouseButtonsTap!, enable: true)
        
        let scrollTap = CGEvent.tapCreate(tap: .cghidEventTap,
                                          place: .headInsertEventTap,
                                          options: .defaultTap,
                                          eventsOfInterest: 1 << CGEventType.scrollWheel.rawValue,
                                          callback: Scrolling.callback,
                                          userInfo: nil)
        let scrollRunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, scrollTap, 1)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), scrollRunLoopSource, CFRunLoopMode.commonModes)
        CGEvent.tapEnable(tap: scrollTap!, enable: true)
        
        Task {
            CFRunLoopRun()
        }
    }
}
