//
//  CoreDataService.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit
import CoreData

final class CoreDataService: NSObject, DataBaseProtocol, MainScreenRequestsProtocol, AddTransactionProtocol {
    
    // MARK: - Properties
    
    lazy var coreDataStack = CoreDataStack(modelName: L10n.General.walletApp)
    
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
          cacheName: Constants.cacheName)
        
        fetchedResultsController.delegate = self
        return fetchedResultsController
    } ()
    
    var didChangeContent: (() -> Void)?
    
    
    // MARK: - MainScreenRequestsProtocol
    
    func fetchData() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
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

// MARK: -

extension CoreDataService: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        didChangeContent?()
    }
}
