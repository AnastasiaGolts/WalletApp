//
//  Date.swift
//  WalletApp
//
//  Created by Anastasia Golts on 29.12.2022.
//

import Foundation

extension Date {
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
}
