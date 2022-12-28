//
//  DataBasePopulator.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import UIKit

final class DataBasePopulator {
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - EmptyDataBase
    
    static func emptyDataBase() {
        let transactions = try! context.fetch(Transaction.fetchRequest())
        transactions.forEach { t in
            context.delete(t)
        }
        try! context.save()
    }
    
    // MARK: - PopulateDataBase
    
    static func populateDataBase() {
        let array = getModels()
        
        array.forEach {
            let transaction = Transaction(context: context)
            transaction.dateOfTransaction = $0.dateOfTransaction
            transaction.amount = $0.amount
            transaction.type = $0.transactionType
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

private extension DataBasePopulator {
    static func getModels() -> [TransactionModel] {
        
        var array = [TransactionModel]()
        
        array.append(contentsOf: setModels(numberOfDays: (13, 14, 15)))
        array.append(contentsOf: setModels(numberOfDays: (10, 11, 12)))
        array.append(contentsOf: setModels(numberOfDays: (7, 8, 9)))
        array.append(contentsOf: setModels(numberOfDays: (4, 5, 6)))
        array.append(contentsOf: setModels(numberOfDays: (1, 2, 3)))
        
        return array
    }
    
    static func setModels(numberOfDays: (Int, Int, Int)) -> [TransactionModel] {
        
        var array = [TransactionModel]()
        
        (2...4).forEach {
            let model = TransactionModel(dateOfTransaction: Calendar.current.date(byAdding: .day, value: -numberOfDays.2, to: Date()),
                                         amount: 25.5,
                                         transactionType: TransactionType.allCases[$0].title)
            array.append(model)
        }
        
        (2...5).forEach {
            let model = TransactionModel(dateOfTransaction: Calendar.current.date(byAdding: .day, value: -numberOfDays.1, to: Date()),
                                         amount: 30.5,
                                         transactionType: TransactionType.allCases[$0].title)
            array.append(model)
        }

        (1...3).forEach {
            let model = TransactionModel(dateOfTransaction: Calendar.current.date(byAdding: .day, value: -numberOfDays.0, to: Date()),
                                         amount: 112.5,
                                         transactionType: TransactionType.allCases[$0].title)
            array.append(model)
        }
        
        return array
    }
}
