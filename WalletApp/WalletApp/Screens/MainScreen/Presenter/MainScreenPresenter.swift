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
    private let dataBaseService: DataBaseProtocol
    
    init(output: MainScreenModuleOutput, networkService: NetworkServiceProtocol, dataBaseService: DataBaseProtocol) {
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
}
