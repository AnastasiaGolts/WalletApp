//
//  CoreDataServiceExtension.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import UIKit

extension CoreDataService {
    
    // MARK: - EmptyDataBase
    
    func emptyDataBase() {
        do {
            try fetchedResultsController.performFetch()
            fetchedResultsController.fetchedObjects?.forEach {
                coreDataStack.managedContext.delete($0)
            }
            try coreDataStack.managedContext.save()
        } catch {
            
        }
    }
    
    func populateDataBase() {
        let array = getModels()

        array.forEach {
            let transaction = Transaction(context: coreDataStack.managedContext)
            transaction.dayOfTransaction = $0.dayOfTransaction
            transaction.timeOfTransaction = $0.timeOfTransaction
            transaction.amount = $0.amount
            transaction.type = $0.transactionType
            coreDataStack.saveContext()
        }
    }
}

private extension CoreDataService {
    func getModels() -> [TransactionModel] {
        
        var array = [TransactionModel]()
        
        array.append(contentsOf: setModels(numberOfDays: (13, 14, 15)))
        array.append(contentsOf: setModels(numberOfDays: (10, 11, 12)))
        array.append(contentsOf: setModels(numberOfDays: (7, 8, 9)))
        array.append(contentsOf: setModels(numberOfDays: (4, 5, 6)))
        array.append(contentsOf: setModels(numberOfDays: (1, 2, 3)))
        
        return array
    }
    
    func setModels(numberOfDays: (Int, Int, Int)) -> [TransactionModel] {
        
        var array = [TransactionModel]()
        
        (2...4).forEach {
            let date = Calendar.current.date(byAdding: .day, value: -numberOfDays.2, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yy"
            
            guard let date = date else {
                return
            }
                                             
            let model = TransactionModel(dayOfTransaction: dateFormatter.string(from: date),
                                         timeOfTransaction: WalletAppDateFormatter.setDateTime().time,
                                         amount: 30.5,
                                         transactionType: TransactionType.allCases[$0].title)
            array.append(model)
        }
        
        (2...5).forEach {
            let date = Calendar.current.date(byAdding: .day, value: -numberOfDays.1, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yy"
            
            guard let date = date else {
                return
            }
            
            let model = TransactionModel(dayOfTransaction: dateFormatter.string(from: date),
                                         timeOfTransaction: WalletAppDateFormatter.setDateTime().time,
                                         amount: 30.5,
                                         transactionType: TransactionType.allCases[$0].title)
            array.append(model)
        }

        (1...3).forEach {
            let date = Calendar.current.date(byAdding: .day, value: -numberOfDays.0, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yy"
            
            guard let date = date else {
                return
            }
            
            let model = TransactionModel(dayOfTransaction: dateFormatter.string(from: date),
                                         timeOfTransaction: WalletAppDateFormatter.setDateTime().time,
                                         amount: 112.5,
                                         transactionType: TransactionType.allCases[$0].title)
            array.append(model)
        }
        
        return array
    }
}

