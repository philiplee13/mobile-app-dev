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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        }
    }
}

