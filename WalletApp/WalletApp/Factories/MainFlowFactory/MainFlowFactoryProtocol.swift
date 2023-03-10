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
                        dataBaseService: MainScreenRequestsProtocol) -> MainScreenViewController
    func showTransactionScreen(moduleOutput: TransactionScreenModuleOutput,
                               dataBaseService: AddTransactionProtocol) -> TransactionScreenViewController
    func showAddMoneyView(moduleOutput: AddMoneyModuleOutput, dataBaseService: AddTransactionProtocol) -> AddMoneyViewController
}
