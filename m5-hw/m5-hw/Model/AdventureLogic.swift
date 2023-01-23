//
//  AdventureLogic.swift
//  m5-hw
//
//  Created by Philip Lee on 1/23/23.
//

import Foundation


struct AdventureLogic {
    
    var optionIndex : Int = 0
    
    let options = [
        Option(_prompt: "You found a briefcase full of money. What do you do?", _goodOption: "You call the cops and report it.",
               _badOption: "You take it.",
               _answer: "You call the cops and report it.",
               _failure: "The cops came when you were picking it up and got caught. Game over."),
        
        // first route
        Option(_prompt: "You chose to call the cops and report it. They come to your location and they ask you to come down to the station with them.",
               _goodOption: "Agree to go to station.",
               _badOption: "Question why first.",
               _answer: "Agree to go to station.",
               _failure: "When you started questioning, they got suspicious and assumed you were the suspect. Game over."),
        // second route
        Option(_prompt: "You go to the station. They start to ask ALOT of questions. Do you take your time to answer all of them?",
               _goodOption: "Answer all the questions truthfully. No matter how long it takes.",
               _badOption: "Refuse to give any answers at the station.",
               _answer: "Answer all the questions truthfully. No matter how long it takes.",
               _failure: "They became suspicious of your unwillingness to work. They now consider you a top suspect. Game over."),

        Option(_prompt: "You start to answer the questions, but start to notice they get a bit more suspicious as time goes on. Do you get irritated with them?",
               _goodOption: "Be patient and answer all of their questions.",
               _badOption: "Have an attitude when answering their questions. It's only fair.",
               _answer: "Be patient and answer all of their questions.",
               _failure: "Your attitude ticked them off. You're now a top suspect. Game over.")
    ]

    let goodResult = "You patiently answered all of their questions. You're free to go home after a long day."
        
    mutating func determineFirstPath(_ response: Any) -> Bool  {
        if (response as! String == options[optionIndex].answer) {
            incrementIndex()
            return true;
        }
        return false;
    }
    
    mutating func incrementIndex() {
        optionIndex += 1
    }
    
    func getNextPrompt() -> Array<Any> {
        var optionArray = Array<Any>()
        if optionIndex == options.count - 1 {
            optionArray.append(goodResult)
            return optionArray
        }
        optionArray.append(options[optionIndex].prompt)
        optionArray.append(options[optionIndex].goodOption)
        optionArray.append(options[optionIndex].badOption)
        return optionArray
    }
    
    func getFailure() -> String {
        return options[optionIndex].failure;
    }

}
