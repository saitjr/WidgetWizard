//
//  WidgetWizardApp.swift
//  WidgetWizard
//
//  Created by tangjiarong on 2025/1/21.
//

import Cocoa
import SwiftUI

import SwiftUI

@main
struct MenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView() // 不需要窗口
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem?
    var popover: NSPopover?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 创建状态栏项
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "star", accessibilityDescription: "Menu Bar App")
            button.title = "ABC"
            button.action = #selector(togglePopover(_:))
        }
        
        // 创建弹出窗口
        popover = NSPopover()
        popover?.contentSize = NSSize(width: 200, height: 100)
        popover?.contentViewController = NSHostingController(rootView: MenuBarView())
        popover?.behavior = .transient
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusItem?.button {
            if popover?.isShown == true {
                popover?.performClose(sender)
            } else {
                popover?.show(relativeTo: button.frame, of: button, preferredEdge: .maxY)
            }
        }
    }
}
