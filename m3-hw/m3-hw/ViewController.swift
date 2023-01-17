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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTodaysDate()
        loadCurrentTime()
    }
    
    func loadTodaysDate() {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let todaysDateFormatted = dateFormatter.string(from: todaysDate)
        dateLabel.text = "\(todaysDateFormatted)"
    }
    
    func loadCurrentTime() {
        let todaysDate = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let timeString = timeFormatter.string(from: todaysDate)
        print("current time is ")
        print(timeString)
        timeLabel.text = "\(timeString)"
    }
}

