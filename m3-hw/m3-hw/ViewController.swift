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
        print("time param is ")
        print(currentTime)
        if (currentTime.contains("PM")) {
            print("IT IS PM")
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nighttime-background")!)
        } else {
            print("IT IS AM")
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "daytime-background")!)
        }
    }
    
    func loadDatePicker() {
        
    }
}

