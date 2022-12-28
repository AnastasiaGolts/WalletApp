//
//  UserDefaults.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

extension UserDefaults {
    
    // MARK: - Balance
    
    func setValueForBalance(value: Double) {
        UserDefaults.standard.setValue(value, forKey: "Balance")
        UserDefaults.standard.synchronize()
    }
    
    func getValueForBalance() -> Double? {
        return UserDefaults.standard.value(forKey: "Balance") as? Double
    }
    
    // MARK: - Populate DataBase
    
    func markAsVisited(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: "IsVisited")
        UserDefaults.standard.synchronize()
    }
    
    func isFirstVisit() -> Bool? {
        return UserDefaults.standard.value(forKey: "IsVisited") as? Bool
    }
    
    // MARK: - Bitcoin
    
    func setTimeOfLastVisit(date: Date) {
        UserDefaults.standard.setValue(date, forKey: "DateOfVisit")
        UserDefaults.standard.synchronize()
    }
    
    func getTimeOfLastVisit() -> Date? {
        return UserDefaults.standard.value(forKey: "DateOfVisit") as? Date
    }
    
    func setValueShouldUpdateBitcoin(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: "ShouldUpdate")
        UserDefaults.standard.synchronize()
    }
    
    func getValueShouldUpdateBitcoin() -> Bool? {
        return UserDefaults.standard.value(forKey: "ShouldUpdate") as? Bool
    }
}
