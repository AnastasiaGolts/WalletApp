//
//  MainScreenView.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    var output: MainScreenViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @objc func showTransactionScreen() {
        output?.showTransactionScreen()
    }
    
    @objc func showAddMoneyScreen() {
        output?.showAddMoneyScreen()
    }
}

extension MainScreenViewController: MainScreenViewInput {
    
}
