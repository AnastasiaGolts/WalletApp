//
//  CoreDataService.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit
import CoreData

final class CoreDataService: DataBaseProtocol, MainScreenRequestsProtocol, AddTransactionProtocol {
    
    // MARK: - Properties
    
    lazy var coreDataStack = CoreDataStack(modelName: "WalletApp")
    
    lazy var fetchedResultsController: NSFetchedResultsController<Transaction> = {
        let fetchRequest: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Transaction.dayOfTransaction), ascending: false)
        let timeSort = NSSortDescriptor(key: #keyPath(Transaction.timeOfTransaction), ascending: false)
        
        fetchRequest.sortDescriptors = [sort, timeSort]
        fetchRequest.fetchBatchSize = 20
        
        let fetchedResultsController = NSFetchedResultsController(
          fetchRequest: fetchRequest,
          managedObjectContext: coreDataStack.managedContext,
          sectionNameKeyPath: #keyPath(Transaction.dayOfTransaction),
          cacheName: "walletApp")
        
        return fetchedResultsController
    } ()
    
    
    // MARK: - MainScreenRequestsProtocol
    
    func fetchData(completion: @escaping (Result<[TransactionModel], Error>) -> Void) {
        var array = [Transaction]()
        var arrayOfModels = [TransactionModel]()
        
        do {
            try fetchedResultsController.performFetch()
            guard let fetchedObjects = fetchedResultsController.fetchedObjects else {
                return
            }
            array = fetchedObjects
        } catch {
            print(error.localizedDescription)
        }
        
        array.forEach {
            guard let type = $0.type,
                  let day = $0.dayOfTransaction,
                  let time = $0.timeOfTransaction else {
                return
            }

            let model = TransactionModel(dayOfTransaction: day,
                                         timeOfTransaction: time,
                                         amount: $0.amount,
                                         transactionType: type)
            arrayOfModels.append(model)
        }
        
        completion(.success(arrayOfModels))
    }
    
    func getNumberOfSections() -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        guard let sectionInfo = fetchedResultsController.sections?[section] else {
            return 0
        }
        return sectionInfo.numberOfObjects
    }
    
    func getCellInfo(indexPath: IndexPath) -> TransactionModel {
        let transaction = fetchedResultsController.object(at: indexPath)
        let model = TransactionModel(dayOfTransaction: transaction.dayOfTransaction ?? "",
                                     timeOfTransaction: transaction.timeOfTransaction ?? "",
                                     amount: transaction.amount,
                                     transactionType: transaction.type ?? "")
        return model
    }
    
    func getSectionName(section: Int) -> String {
        guard let name = fetchedResultsController.sections?[section].name else {
            return ""
        }
        return name
    }
    
    // MARK: - AddTransactionProtocol
    
    func addTransaction(transactionModel: TransactionModel) {
        let transaction = Transaction(context: coreDataStack.managedContext)
        transaction.amount = transactionModel.amount
        transaction.type = transactionModel.transactionType
        transaction.dayOfTransaction = transactionModel.dayOfTransaction
        transaction.timeOfTransaction = transactionModel.timeOfTransaction
        coreDataStack.saveContext()
    }
}
