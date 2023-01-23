//
//  ViewController.swift
//  m5-hw
//
//  Created by Philip Lee on 1/23/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var promptText: UITextView!
    @IBOutlet weak var optionB: UIButton!
    
    var optionLogic = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadInitial()
    }
    
    func loadInitial() {
        promptText.text = optionLogic.options[0].prompt
        optionA.setTitle(optionLogic.options[0].goodOption, for: .normal)
        optionB.setTitle(optionLogic.options[0].badOption, for: .normal)
    }
    
    @IBAction func updateGoodPath(_ sender: Any) {
        if optionLogic.determineFirstPath(optionA.titleLabel!.text!) {
            let options = optionLogic.getNextPrompt()
            if options.count == 1 {
                promptText.text = (options[0] as! String);
                optionA.isEnabled = false;
                optionB.isEnabled = false;
            } else {
                promptText.text = (options[0] as! String)
                optionA.setTitle((options[1] as! String), for: .normal)
                optionB.setTitle((options[2] as! String), for: .normal)
            }
        }
    }

    @IBAction func updateBadPath(_ sender: Any) {
        promptText.text = optionLogic.getFailure()
        optionA.isEnabled = false;
        optionB.isEnabled = false;
       }
    }


