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
                        dataBaseService: MainScreenRequestsProtocol) -> MainScreenViewController {
        let presenter = MainScreenPresenter(output: moduleOutput, networkService: networkService)
        let viewController = MainScreenViewController()
        
        dataBaseService.didChangeContent = {
            presenter.didChangeContent()
        }
        
        presenter.dataBaseService = dataBaseService
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
    
    func showTransactionScreen(moduleOutput: TransactionScreenModuleOutput,
                               dataBaseService: AddTransactionProtocol) -> TransactionScreenViewController {
        let presenter = TransactionScreenPresenter(output: moduleOutput, dataBaseService: dataBaseService)
        let viewController = TransactionScreenViewController()
        
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
    
    func showAddMoneyView(moduleOutput: AddMoneyModuleOutput, dataBaseService: AddTransactionProtocol) -> AddMoneyViewController {
        
        let presenter = AddMoneyPresenter(output: moduleOutput, dataBase: dataBaseService)
        let viewController = AddMoneyViewController()

        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
}
