//
//  MainFlowFactoryProtocol.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

protocol MainFlowFactoryProtocol: AnyObject {
    func showMainScreen(moduleOutput: MainScreenModuleOutput,
                        networkService: NetworkServiceProtocol,
                        dataBaseService: DataBaseProtocol) -> MainScreenViewController
    func showTransactionScreen(moduleOutput: TransactionScreenModuleOutput,
                               dataBaseService: DataBaseProtocol) -> TransactionScreenViewController
    func showAddMoneyView(moduleOutput: AddMoneyModuleOutput, dataBaseService: DataBaseProtocol) -> AddMoneyViewController
}
