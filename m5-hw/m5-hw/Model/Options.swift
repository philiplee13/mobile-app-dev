//
//  Options.swift
//  m5-hw
//
//  Created by Philip Lee on 1/23/23.
//

import Foundation

struct Option {
    
    init(_prompt: String, _goodOption: String, _badOption: String, _answer: String, _failure: String) {
        prompt = _prompt;
        goodOption = _goodOption;
        badOption = _badOption;
        answer = _answer;
        failure = _failure;
    }
    
    var prompt: String;
    var goodOption: String;
    var badOption: String;
    var answer: String
    var failure: String
    
    
}
