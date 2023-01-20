//
//  ViewController.swift
//  m3-hw
//
//  Created by Philip Lee on 1/17/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var timeFormatter = DateFormatter()
    var dateFormatter = DateFormatter()
    var todaysDate = Date()
    @IBOutlet weak var timer: UIDatePicker!
    @IBOutlet weak var messageLabel: UILabel!
    var totalTime: Int?
    var timeLeft: Int?
    var timerCountDown = Timer()
    @IBOutlet weak var timerButton: UIButton!
    var player: AVAudioPlayer?
    
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
    
    // loads todays date
    func loadTodaysDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let todaysDateFormatted = dateFormatter.string(from: todaysDate)
        dateLabel.text = "\(todaysDateFormatted)"
    }
    
    // sets the current time
    func loadCurrentTime() -> String{
        let timeString = timeFormatter.string(from: todaysDate)
        timeLabel.text = "\(timeString)"
        return timeString
    }
    
    // update the timeLabel with current time as it changes
    @objc func updateClock() {
        let now = Date()
        let currentTime = timeFormatter.string(from: now)
        timeLabel.text = "\(currentTime)"
        loadBackground(currentTime: currentTime)
    }
    
    // Load the background based on the time
    func loadBackground(currentTime: String) {
        print("in load background function")
        if (currentTime.contains("PM")) {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nighttime-background")!)
            dateLabel.textColor = UIColor.white
            timeLabel.textColor = UIColor.white
            messageLabel.textColor = UIColor.white
            
            
        } else if (currentTime.contains("AM")) {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "daylight-background")!)
            dateLabel.textColor = UIColor.black
            timeLabel.textColor = UIColor.black
            messageLabel.textColor = UIColor.black
        }
    }
    
    // Loads the UIDatePicker Timer
    func loadTimer() {
        timer.frame = CGRect(x: 200, y: 300,
                                  width: self.view.frame.width, height: 100)
        timer.datePickerMode = UIDatePicker.Mode.countDownTimer
        timer.preferredDatePickerStyle = .wheels
        timer.minuteInterval = 1
        timer.countDownDuration = 10
        self.view.addSubview(timer)
    }
    
    // Starts the countdown timer
    @IBAction func startTimer(_ sender: Any) {
        if (timerButton.titleLabel!.text == "Start Timer") {
        totalTime = Int(timer.countDownDuration)
        timeLeft = totalTime
        // start the actual countdown
        timerCountDown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCountDown), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        print("time left is")
        print(timeLeft!)
        if timeLeft! <= 0 {
            timerButton.setTitle("Stop Music", for: .normal)
            playSound()
        }
    }
    
    // stop music and reset button label
    @IBAction func stopMusic(_ sender: Any) {
        if (timerButton.titleLabel!.text == "Stop Music") {
            timerButton.setTitle("Start Timer", for: .normal)
            player?.stop()
        }
    }
    
    // Updates the message label with remaining time
    @objc func startCountDown() {
            if timeLeft! >= 0 {
                messageLabel.text = "\(timeLeft!) seconds remaining!"
                timeLeft! -= 1
            } else {
                timerCountDown.invalidate()
                stopTimer()
            }
        }
    
    // method to start playing button
    func playSound() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            // ios 11 bug
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()
            print("reached end of play function")

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

