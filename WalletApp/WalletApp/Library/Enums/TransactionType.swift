//
//  TransactionType.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

enum TransactionType {
    case groceries
    case taxi
    case restaurants
    case electronics
    case other
    
    var title: String {
        switch self {
        case .groceries:
            return "Groceries"
        case .taxi:
            return "Taxi"
        case .restaurants:
            return "Restaurants"
        case .electronics:
            return "Electronics"
        case .other:
            return "Other"
        }
    }
}
