//
//  TransactionType.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

enum TransactionType: CaseIterable {
    case notChosen
    case groceries
    case taxi
    case restaurants
    case electronics
    case other
    
    var title: String {
        switch self {
        case .notChosen:
            return L10n.TransactionType.notChosen
        case .groceries:
            return L10n.TransactionType.groceries
        case .taxi:
            return L10n.TransactionType.taxi
        case .restaurants:
            return L10n.TransactionType.restaurants
        case .electronics:
            return L10n.TransactionType.electronics
        case .other:
            return L10n.TransactionType.other
        }
    }
}
