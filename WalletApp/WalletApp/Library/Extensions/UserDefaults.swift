//
//  UserDefaults.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

extension UserDefaults {
    
    func setValueForBalance(value: Double) {
        UserDefaults.standard.setValue(value, forKey: "Balance")
        UserDefaults.standard.synchronize()
    }
    
    func getValueForBalance() -> Double? {
        return UserDefaults.standard.value(forKey: "Balance") as? Double
    }
}
