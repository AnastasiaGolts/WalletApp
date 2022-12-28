//
//  CoreDataService.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation
import CoreData

final class CoreDataService: DataBaseProtocol, MainScreenRequestsProtocol {
    
    var isPaginating = false
    
    func fetchData(pagination: Bool, completion: @escaping (Result<[TransactionModel], Error>) -> Void) {
        
    }
}
