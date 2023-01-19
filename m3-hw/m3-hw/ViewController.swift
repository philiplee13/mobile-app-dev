//
//  ViewController.swift
//  m3-hw
//
//  Created by Philip Lee on 1/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var timeFormatter = DateFormatter()
    var dateFormatter = DateFormatter()
    var todaysDate = Date()
    @IBOutlet weak var timer: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        timeFormatter.dateFormat = "HH:mm:ss a"
        timeFormatter.amSymbol = "AM"
        timeFormatter.pmSymbol = "PM"
        
        loadTodaysDate()
        let currentTime = loadCurrentTime()
        loadBackground(currentTime: currentTime)
        loadTimer()
        Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateClock), userInfo:nil, repeats: true)
    }
    
    
    func loadTodaysDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let todaysDateFormatted = dateFormatter.string(from: todaysDate)
        dateLabel.text = "\(todaysDateFormatted)"
    }
    
    func loadCurrentTime() -> String{
        let timeString = timeFormatter.string(from: todaysDate)
        timeLabel.text = "\(timeString)"
        return timeString
    }
    
    @objc func updateClock() {
        let now = Date()
        let currentTime = timeFormatter.string(from: now)
        timeLabel.text = "\(currentTime)"
        loadBackground(currentTime: currentTime)
    }
    
    func loadBackground(currentTime: String) {
        if (currentTime.contains("PM")) {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nighttime-background")!)
        } else {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "daylight-background")!)
        }
    }
    
    func loadTimer() {
        timer.frame = CGRect(x: 200, y: 300,
                                  width: self.view.frame.width, height: 100)
        timer.datePickerMode = UIDatePicker.Mode.countDownTimer
        timer.preferredDatePickerStyle = .wheels
        timer.minuteInterval = 5
        timer.countDownDuration = 4500
        self.view.addSubview(timer)
    }
}

