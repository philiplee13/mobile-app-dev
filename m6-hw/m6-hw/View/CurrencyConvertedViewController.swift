//
//  CurrencyConvertedViewController.swift
//  m6-hw
//
//  Created by Philip Lee on 1/30/23.
//

import UIKit

class CurrencyConvertedViewController: UIViewController {
    
    var originalAmount = ""
    var currenciesToConvert: [String] = []
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var yuanConversion: UILabel!
    @IBOutlet weak var euroConversion: UILabel!
    @IBOutlet weak var japaneseYenConversion: UILabel!
    @IBOutlet weak var koreanWonConversion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = "Original amount was \(originalAmount)"
        print(currenciesToConvert)
        convertCurrency(_currenciesToConvert: currenciesToConvert, _originalAmount: originalAmount)
        
        // Do any additional setup after loading the view.
    }
    
    func convertCurrency(_currenciesToConvert: Array<String>, _originalAmount: String) {
        if _currenciesToConvert.contains("Korean") {
            koreanWonConversion.text = convertUSDToWon(_originalAmount: _originalAmount)
        }
        
        if _currenciesToConvert.contains("Japanese") {
            japaneseYenConversion.text = convertUSDToYen(_originalAmount: _originalAmount)
        }
        
        if _currenciesToConvert.contains("Euro") {
            euroConversion.text = convertUSDToEuro(_originalAmount: _originalAmount)
        }
        
        if _currenciesToConvert.contains("Chinese") {
            yuanConversion.text = convertUSDToYuan(_originalAmount: _originalAmount)
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
