//
//  ApplicationCoordinator.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class ApplicationCoordinator {
    
    // MARK: - Properties
    
    private let networkService: NetworkServiceProtocol
    private let dataBase: DataBaseProtocol
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    private var mainFlowCoordinator: CoordinatorProtocol?
    
    init(window: UIWindow) {
        self.networkService = NetworkService()
        self.dataBase = CoreDataService()
        
        //dataBase.populateDataBase()
        
        self.window = window
        self.navigationController = UINavigationController()
        
        setUpWindow()
        setUpMainFlowCoordinator()
    }

}

// MARK: - CoordinatorProtocol

extension ApplicationCoordinator: CoordinatorProtocol {
    func start() {
        mainFlowCoordinator?.start()
    }
}

// MARK: - Private Methods

private extension ApplicationCoordinator {
    func setUpWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func setUpMainFlowCoordinator() {
        mainFlowCoordinator = MainFlowCoordinator(navigationController: navigationController,
                                                  networkService: networkService,
                                                  dataBase: dataBase)
    }
}
