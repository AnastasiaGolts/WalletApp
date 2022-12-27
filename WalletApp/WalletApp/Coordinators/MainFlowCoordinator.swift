//
//  MainFlowCoordinator.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class MainFlowCoordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let networkService: NetworkServiceProtocol
    private let dataBase: DataBaseProtocol
    
    private let mainFlowFactory: MainFlowFactoryProtocol
    
    init(navigationController: UINavigationController, networkService: NetworkServiceProtocol, dataBase: DataBaseProtocol, mainFlowFactory: MainFlowFactoryProtocol = MainFlowFactory()) {
        self.navigationController = navigationController
        self.networkService = networkService
        self.dataBase = dataBase
        self.mainFlowFactory = mainFlowFactory
    }
    

}

extension MainFlowCoordinator: CoordinatorProtocol {
    func start() {
        showMainScreen()
    }
}

extension MainFlowCoordinator: MainScreenModuleOutput {
    func showTransactionModule() {
        showTransactionScreen()
    }
    
    func showAddMoneyModule() {
        showAddMoneyScreen()
    }

}

extension MainFlowCoordinator: TransactionScreenModuleOutput {
    func returnToMainModule() {
        returnToMainScreen()
    }
}

extension MainFlowCoordinator: AddMoneyModuleOutput {
    func returnToMain() {
        returnToMainScreen()
    }
}

extension MainFlowCoordinator {
    func showMainScreen() {
        let mainScreen = mainFlowFactory.showMainScreen(moduleOutput: self, networkService: networkService, dataBaseService: dataBase)
        navigationController.viewControllers = [mainScreen]
    }
    
    func showTransactionScreen() {
        let transactionScreen = mainFlowFactory.showTransactionScreen(moduleOutput: self, dataBaseService: dataBase)
        navigationController.pushViewController(transactionScreen, animated: true)
    }
    
    func showAddMoneyScreen() {
        let addMoneyScreen = mainFlowFactory.showAddMoneyView(moduleOutput: self, dataBaseService: dataBase)
        navigationController.pushViewController(addMoneyScreen, animated: true)
    }
    
    func returnToMainScreen() {
        navigationController.popToRootViewController(animated: true)
    }
}
