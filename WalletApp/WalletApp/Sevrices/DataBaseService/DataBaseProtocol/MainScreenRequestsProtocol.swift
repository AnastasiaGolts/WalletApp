//
//  MainScreenRequestsProtocol.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

protocol MainScreenRequestsProtocol: AnyObject {
    func fetchData()
    func getNumberOfSections() -> Int
    func getNumberOfRowsInSection(section: Int) -> Int
    func getCellInfo(indexPath: IndexPath) -> TransactionModel
    func getSectionName(section: Int) -> String
    
    var didChangeContent: (() -> Void)? { get set }
}
