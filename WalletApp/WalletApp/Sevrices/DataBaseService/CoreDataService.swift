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
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - MainScreenRequestsProtocol
    
    var isPaginating = false
    
    func fetchData(pagination: Bool, completion: @escaping (Result<[TransactionModel], Error>) -> Void) {
        
        if pagination {
            isPaginating = true
        }
        
        var array = [Transaction]()
        var arrayOfModels = [TransactionModel]()
        
        do {
            let request = Transaction.fetchRequest() as NSFetchRequest<Transaction>
            array = try context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
        
        array.forEach {
            guard let type = $0.type else {
                return
            }
            guard let date = $0.dateOfTransaction else {
                return
            }
            let model = TransactionModel(dateOfTransaction: date,
                                         amount: $0.amount,
                                         transactionType: type)
            arrayOfModels.append(model)
        }
        
        completion(.success(arrayOfModels))
        
        if pagination {
            isPaginating = false
        }
    }
    
    // MARK: - AddTransactionProtocol
    
    func addTransaction(transactionModel: TransactionModel) {
        let transaction = Transaction(context: context)
        transaction.amount = transactionModel.amount
        transaction.type = transactionModel.transactionType
        transaction.dateOfTransaction = transactionModel.dateOfTransaction
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
