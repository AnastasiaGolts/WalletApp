//
//  MainFlowFactory.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation
import UIKit

final class MainFlowFactory: MainFlowFactoryProtocol {
    func showMainScreen(moduleOutput: MainScreenModuleOutput,
                        networkService: NetworkServiceProtocol,
                        dataBaseService: DataBaseProtocol) -> MainScreenViewController {
        let presenter = MainScreenPresenter(output: moduleOutput, networkService: networkService, dataBaseService: dataBaseService)
        let viewController = MainScreenViewController()
        
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
    
    func showTransactionScreen(moduleOutput: TransactionScreenModuleOutput,
                               dataBaseService: DataBaseProtocol) -> TransactionScreenViewController {
        let presenter = TransactionScreenPresenter(output: moduleOutput, dataBaseService: dataBaseService)
        let viewController = TransactionScreenViewController()
        
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
    
    func showAddMoneyView(moduleOutput: AddMoneyModuleOutput, dataBaseService: DataBaseProtocol) -> AddMoneyViewController {
        
        let viewController = AddMoneyViewController()
        let presenter = AddMoneyPresenter(output: moduleOutput, dataBase: dataBaseService)

        presenter.view = viewController
        viewController.output = presenter
        
        return AddMoneyViewController()
    }
}
