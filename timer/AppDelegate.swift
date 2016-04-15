//
//  AppDelegate.swift
//  timer
//
//  Created by Sam Rensenhosue on 3/22/16.
//  Copyright © 2016 Sam Rensenhosue. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!

    var timerWindows = [TimerWindowController()]
    @IBOutlet weak var startMenuItem: NSMenuItem!
    @IBOutlet weak var stopMenuItem: NSMenuItem!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        newTimerWindow(self)

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
//        override func  validateMenuItem(menuItem: NSMenuItem) -> Bool {
//        if(menuItem == startMenuItem){
//            return !timer!.running
//        }
//        else if(menuItem == stopMenuItem){
//            return timer!.running
//        }
//        return true
//    }
    @IBAction func newTimerWindow(sender: AnyObject) {
        let timerWindow = TimerWindowController()
        timerWindows.append(timerWindow)
        timerWindow.showWindow(self)
    }
}

