//
//  TimerModel.swift
//  timer
//
//  Created by Sam Rensenhosue on 3/22/16.
//  Copyright © 2016 Sam Rensenhosue. All rights reserved.
//

import Foundation

public protocol TimerModelDelegate{
    func secondChanged(seconds: Int)
}

public class TimerModel: NSObject{
    var seconds: Int = 0
    var stopping: Bool = false
    
    public private(set) var running:Bool = false
    
    
    public var delegate: TimerModelDelegate? = nil
    
    func alertDelegate(){
        delegate!.secondChanged(seconds)
    }
    
    func countUp(theTimer: NSTimer){
        if(!stopping){
            seconds++
            alertDelegate()
        } else{
            theTimer.invalidate()
            running = false
            stopping = false
        }
    }
    func start(){
        let timer = NSTimer(timeInterval: 1, target: self, selector: "countUp:", userInfo: nil, repeats: true)
        let loop = NSRunLoop.currentRunLoop()
        loop.addTimer(timer, forMode: NSRunLoopCommonModes)
        running = true
    }
    func stop(){
        stopping = true
        running = false
        
    }
    
    func reset(){
        seconds = 0
        alertDelegate()
    }
    
    
    
    
    
    
    
    
}