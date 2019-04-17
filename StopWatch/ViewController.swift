//
//  ViewController.swift
//  StopWatch
//
//  Created by dit03 on 2019. 4. 3..
//  Copyright © 2019년 201835867. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    @IBOutlet weak var Time: UILabel!
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Time.text = "00:00:00"
        changeButtonState(start: true, pause: false, stop: false)
    }
    
    
    @IBAction func btnStart(_ sender: Any) {
        if !timer.isValid{
            //  선행 클로저
//            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (Timer) in
//                self.time += 1
//                let min = self.time / 6000
//                let sec = self.time / 100 - (min*60)
//                let msec = self.time % 100
//                let output = String(format: "%02d:%02d:%02d", min, sec, msec)
//                self.Time.text = output
//            })
            
            // 후행 클로저
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {(timer: Timer) -> Void in
                self.time += 1
                let min = self.time / 6000
                let sec = self.time / 100 - (min*60)
                let msec = self.time % 100
                let output = String(format: "%02d:%02d:%02d", min, sec, msec)
                self.Time.text = output
            }
            changeButtonState(start: false, pause: true, stop: true)
        }
        
       
    }
    
    @IBAction func btnPause(_ sender: Any) {
        timer.invalidate()
        changeButtonState(start: true, pause: false, stop: true)
    }
    
    
    @IBAction func btnReset(_ sender: Any) {
        
        timer.invalidate()
        time = 0
        Time.text = "00:00:00"
        changeButtonState(start: true, pause: false, stop: false)
    }
    
    func changeButtonState(start : Bool, pause : Bool, stop : Bool) {
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
    

}

