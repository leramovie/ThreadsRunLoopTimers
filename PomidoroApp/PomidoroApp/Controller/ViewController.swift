//
//  ViewController.swift
//  PomidoroApp
//
//  Created by Valery Shel on 10.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    
    var pomidoroTimer: Timer?

    var i: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 5
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pomidoroTimer?.invalidate()
    }

    private func startTimer() {
        pomidoroTimer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(changeTimerLabel),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func changeTimerLabel() {
        if i > 0 {
            i -= 1
            timerLabel.text = String(i) + String(" sec")
        } else {
            pomidoroTimer?.invalidate()
            startButton.isHidden = false
            timerLabel.text = "45 sec"

        }
    }
    
    @IBAction func startButtonTouched(_ sender: Any) {
        i = 45
        startButton.isHidden = true
        startTimer()
        
    }
}


