//
//  Conversion.swift
//  m6-hw
//
//  Created by Philip Lee on 1/30/23.
//

import Foundation


func convertUSDToWon(_originalAmount: String) -> String {
    let oneKoreanWon = 1231.527093596
    let result = (Double(_originalAmount)! * oneKoreanWon)
    return String(result)
}

func convertUSDToYen(_originalAmount: String) -> String {
    let oneJapaneseYen = 130.41
    let result = (Double(_originalAmount)! * oneJapaneseYen)
    return String(result)
}

func convertUSDToEuro(_originalAmount: String) -> String {
    let oneEuro = 0.92
    let result = (Double(_originalAmount)! * oneEuro)
    return String(result)
}

func convertUSDToYuan(_originalAmount: String) -> String {
    let oneChineseYuan = 6.75
    let result = (Double(_originalAmount)! * oneChineseYuan)
    return String(result)
}
