//
//  WalletAppDateFormatter.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

typealias DateType = (date: String, time: String)

final class WalletAppDateFormatter {
    static func setDateTime() -> DateType {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yy"
        let dateString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeString = dateFormatter.string(from: date)
        
        return(dateString, timeString)
    }
}
