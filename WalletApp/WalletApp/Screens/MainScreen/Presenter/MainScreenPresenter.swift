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
    var dataBaseService: MainScreenRequestsProtocol?
    
    private var price = String()
    
    init(output: MainScreenModuleOutput, networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        self.output = output
    }
    
    func didChangeContent() {
        view?.didChangeContent()
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
    
    func fetchTransactionData() {
        dataBaseService?.fetchData()
    }
    
    // MARK: - TableViewData
    
    func getNumberOfSections() -> Int {
        return dataBaseService?.getNumberOfSections() ?? 0
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        return dataBaseService?.getNumberOfRowsInSection(section: section) ?? 0
    }
    
    func getCellInfo(indexPath: IndexPath) -> TransactionModel {
        let emptyModel = TransactionModel(dayOfTransaction: "",
                                          timeOfTransaction: "",
                                          amount: 0.0,
                                          transactionType: "")
        return dataBaseService?.getCellInfo(indexPath: indexPath) ?? emptyModel
    }
    
    func getSectionName(section: Int) -> String {
        return dataBaseService?.getSectionName(section: section) ?? ""
    }
    
    // MARK: - Labels Data
    
    func getBalanceInfo() -> String {
        guard let value = UserDefaults.standard.getValueForBalance() else {
            return ""
        }
        let string = String(format: Constants.doubleFormat, value)
        return L10n.MainScreen.balance + string
    }
    
    func getBitcoinPrice() async -> String {
        
        do {
            let floatPrice = try await networkService.fetchBitcoinPrice()
            price = String(format: Constants.doubleFormat, floatPrice)
        } catch {
            
        }
        
        return L10n.MainScreen.bitcoin + price + "$"
    }

}
