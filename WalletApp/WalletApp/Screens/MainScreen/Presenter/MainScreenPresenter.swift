//
//  MainScreenPresenter.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

final class MainScreenPresenter {
    
    // MARK: - Properties
    
    weak var view: MainScreenViewInput?
    
    private let output: MainScreenModuleOutput
    private let networkService: NetworkServiceProtocol
    private let dataBaseService: MainScreenRequestsProtocol
    
    private var array = [TransactionModel]()
    
    init(output: MainScreenModuleOutput, networkService: NetworkServiceProtocol, dataBaseService: MainScreenRequestsProtocol) {
        self.networkService = networkService
        self.dataBaseService = dataBaseService
        self.output = output
    }
}

// MARK: - MainScreenViewOutput

extension MainScreenPresenter: MainScreenViewOutput {
    func showTransactionScreen() {
        output.showTransactionModule()
    }
    
    func showAddMoneyScreen() {
        output.showAddMoneyModule()
    }
    
    func fetchTransactionData() -> [TransactionModel] {

        dataBaseService.fetchData { result in
            switch result {
            case .success(let array):
                self.array = array
            case .failure(let error):
                print(error)
            }
        }
        return array
    }
    
    func getNumberOfSections() -> Int {
        return dataBaseService.getNumberOfSections()
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        return dataBaseService.getNumberOfRowsInSection(section: section)
    }
    
    func getCellInfo(indexPath: IndexPath) -> TransactionModel {
        return dataBaseService.getCellInfo(indexPath: indexPath)
    }
    
    func getSectionName(section: Int) -> String {
        return dataBaseService.getSectionName(section: section)
    }
    
    func getBalanceInfo() -> String {
        guard let value = UserDefaults.standard.getValueForBalance() else {
            return ""
        }
        let string = String(format: "%.2f", value)
        return string  + "$"
    }
}
