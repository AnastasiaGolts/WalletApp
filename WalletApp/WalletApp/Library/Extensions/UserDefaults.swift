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
        UserDefaults.standard.setValue(value, forKey: Constants.usertDefaultsKeyBalance)
        UserDefaults.standard.synchronize()
    }
    
    func getValueForBalance() -> Double? {
        return UserDefaults.standard.value(forKey: Constants.usertDefaultsKeyBalance) as? Double
    }
    
    // MARK: - Populate DataBase
    
    func markAsVisited(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: Constants.usertDefaultsKeyIsVisited)
        UserDefaults.standard.synchronize()
    }
    
    func isFirstVisit() -> Bool? {
        return UserDefaults.standard.value(forKey: Constants.usertDefaultsKeyIsVisited) as? Bool
    }
    
    // MARK: - Bitcoin
    
    func setTimeOfLastVisit(date: Date) {
        UserDefaults.standard.setValue(date, forKey: Constants.usertDefaultsKeyDateOfVisit)
        UserDefaults.standard.synchronize()
    }
    
    func getTimeOfLastVisit() -> Date? {
        return UserDefaults.standard.value(forKey: Constants.usertDefaultsKeyDateOfVisit) as? Date
    }
    
    func setValueShouldUpdateBitcoin(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: Constants.usertDefaultsKeyShouldUpdate)
        UserDefaults.standard.synchronize()
    }
    
    func getValueShouldUpdateBitcoin() -> Bool? {
        return UserDefaults.standard.value(forKey: Constants.usertDefaultsKeyShouldUpdate) as? Bool
    }
}
