//
//  SBPulseView.swift
//  UIPro
//
//  Created by Klaas Schoenmaker on 18-12-15.
//  Copyright © 2015 Klaas Schoenmaker. All rights reserved.
//

import UIKit

class SBPulseView: UIView {
    var radius: CGFloat!
    var duration: NSTimeInterval!
    var interval: NSTimeInterval!
    var colors: [UIColor]!
    
    private var pulsing = true
    private var pulseTimer: NSTimer?
    private var currentPulse = 0
    
    var isPulsing: Bool {
        return pulsing
    }
    
    init(_ frame: CGRect, withDuration duration: NSTimeInterval?, withPulseInterval interval: NSTimeInterval?, withColors colors: [UIColor]?) {
        super.init(frame: frame)
        
        // Set variables to user values
        
        self.radius = (frame.size.height < frame.size.width ? frame.size.height : frame.size.width) // Smallest dimension becomes radius
        self.duration = duration
        self.interval = interval
        self.colors = colors
        
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set variables to default values
        
        self.radius = (frame.size.height < frame.size.width ? frame.size.height : frame.size.width) // Smallest dimension becomes radius
        self.duration = 1.5
        self.interval = 0.5
        self.colors = [UIColor.redColor()]
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.pulseTimer = NSTimer.scheduledTimerWithTimeInterval(self.interval, target: self, selector: Selector("pulse"), userInfo: nil, repeats: true)
    }
    
    func pulse() {
        let pulseView = UIView(frame: CGRectMake(0, 0, self.radius, self.radius))
        pulseView.center.x = self.frame.size.width/2
        pulseView.center.y = self.frame.size.height/2
        pulseView.backgroundColor = self.colors[self.currentPulse]
        pulseView.layer.cornerRadius = self.radius/2
        pulseView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        self.addSubview(pulseView)
        
        UIView.animateWithDuration(self.duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            pulseView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            pulseView.alpha = 0.0
            
            }, completion: { (value: Bool) -> Void in
                
                pulseView.removeFromSuperview()
                
        })
        
        
        self.currentPulse = (self.currentPulse + 1) % self.colors.count
    }
    
    func stopPulsing() {
        if self.isPulsing {
            self.pulsing = false
            self.pulseTimer?.invalidate()
        } else {
            print("Already stopped pulsing; can't stop anymore.")
        }
    }
    
    func startPulsing() {
        if !self.isPulsing {
            self.pulsing = true
            self.pulseTimer = NSTimer.scheduledTimerWithTimeInterval(self.interval, target: self, selector: Selector("pulse"), userInfo: nil, repeats: true)
        } else {
            print("Already started pulsing; can't start again.")
        }
    }
}