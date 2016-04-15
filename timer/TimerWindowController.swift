//
//  TimerWindowController.swift
//  timer
//
//  Created by Sam Rensenhosue on 3/31/16.
//  Copyright © 2016 Sam Rensenhosue. All rights reserved.
//

import Cocoa

class TimerWindowController: NSWindowController, TimerModelDelegate {
    
    static var windowCounter: Int = 0
    var timer:TimerModel? = nil
    @IBOutlet weak var timerDisplay: NSTextField!
    
    @IBOutlet weak var startStopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!


    
    convenience init(){
        self.init(windowNibName:"TimerWindowController")
        timer = TimerModel()
        timer!.delegate = self
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.title = "Timer \( ++TimerWindowController.windowCounter)"
    }
    func secondChanged(seconds: Int) {
        var s = seconds
        let h = s/3600
        s %= 3600
        let m = s/60
        s %= 60
        timerDisplay.stringValue = String(format: "%02ld:%02ld:%02ld",h,m,s)
    }
    func startTimer(){
        timer!.start()
        startStopButton.title = "Stop"
        resetButton.enabled = false
    }
    
    
    func stopTimer(){
        timer!.stop()
        startStopButton.title = "Start"
        resetButton.enabled = true
    }
    
    
    
    @IBAction func startStopButton(sender: AnyObject) {
        if (timer!.running){
            stopTimer()
        } else{in
            startTimer()
        }
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        timer!.reset()
    }
    

    
}
