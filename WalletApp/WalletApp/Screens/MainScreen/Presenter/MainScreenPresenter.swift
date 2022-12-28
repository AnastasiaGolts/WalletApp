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

extension MainScreenPresenter: MainScreenViewOutput {
    func showTransactionScreen() {
        output.showTransactionModule()
    }
    
    func showAddMoneyScreen() {
        output.showAddMoneyModule()
    }
    
    func fetchTransactionData(pagination: Bool) -> [TransactionModel] {
        guard !dataBaseService.isPaginating else {
            return [TransactionModel]()
        }
        dataBaseService.fetchData(pagination: pagination) { result in
            switch result {
            case .success(let array):
                self.array = array
            case .failure(let error):
                print(error)
            }
        }
        return array
    }
}
