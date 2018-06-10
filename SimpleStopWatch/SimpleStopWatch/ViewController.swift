//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Simon on 2018-06-10.
//  Copyright © 2018 simeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seconds: Double = 0.0
    var timer: Timer = Timer()
    var isPlaying: Bool = false
    
    @IBOutlet weak var timerLbl: UILabel!
    
    @IBAction func pauseBtnClicked(_ sender: UIButton) {
        pauseTimer()
    }
    
    @IBAction func playBtnClicked(_ sender: UIButton) {
        runTimer()
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        seconds = 0.0
        setTimerText(seconds: seconds)
        isPlaying = false
        timer.invalidate()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: (#selector(ViewController.startTimer)),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func startTimer() {
        seconds = (seconds + 0.1)
        setTimerText(seconds: seconds)
        isPlaying = true
    }
    
    @objc func pauseTimer() {
        if isPlaying {
            timer.invalidate()
            isPlaying = false
        }
    }
    
    fileprivate func setTimerText(seconds: Double) {
        timerLbl.text = String(format: "%.1f", seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Set status bar to white and background to dark
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

