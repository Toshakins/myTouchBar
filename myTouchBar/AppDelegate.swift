//
//  AppDelegate.swift
//  try
//
//  Created by ao on 05.04.2020.
//  Copyright © 2020 ao. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTouchBarDelegate {
    
    var window: NSWindow!
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    var mainController: MyHostingController!

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        let popover = NSPopover()
        if #available(OSX 10.12.2, *) {
            NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        }
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        self.mainController = MyHostingController(rootView: AnyView(contentView))
        popover.contentViewController = mainController
        NSApp.touchBar = mainController.touchBar
        self.popover = popover
        
        self.statusBarItem = NSStatusBar.system.statusItem(
            withLength: CGFloat(NSStatusItem.variableLength));
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "Icon")
            button.action = #selector(togglePopover(_:))
        }
        print("ololo")
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

