//
//  ViewController.swift
//  m6-hw
//
//  Created by Philip Lee on 1/30/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var amountToConvert: UITextField!
    
    @IBOutlet weak var koreanWonToggle: UISwitch!
    @IBOutlet weak var chineseYuanToggle: UISwitch!
    @IBOutlet weak var euroToggle: UISwitch!
    @IBOutlet weak var japaneseYenToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        koreanWonToggle.isOn = false
        chineseYuanToggle.isOn = false
        euroToggle.isOn = false
        japaneseYenToggle.isOn = false
        
    }


    @IBAction func navigateToConvertedView(_ sender: Any) {
        self.performSegue(withIdentifier: "toConvertedCurrency", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConvertedCurrency" {
            let conversionView = segue.destination as! CurrencyConvertedViewController
            conversionView.originalAmount = amountToConvert.text!
            if koreanWonToggle.isOn == true {
                conversionView.currenciesToConvert.append("Korean")
            }
            if chineseYuanToggle.isOn == true {
                conversionView.currenciesToConvert.append("Chinese")
            }
            if euroToggle.isOn == true {
                conversionView.currenciesToConvert.append("Euro")
            }
            if japaneseYenToggle.isOn == true {
                conversionView.currenciesToConvert.append("Japanese")
            }
        }
    }
}

