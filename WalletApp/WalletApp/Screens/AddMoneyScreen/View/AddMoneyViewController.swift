//
//  AddMoneyViewController.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class AddMoneyViewController: UIViewController {
    
    // MARK: - Properties
    
    var output: AddMoneyViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func returnToMain() {
        output?.returnToMainScreen()
    }
    
}

extension AddMoneyViewController: AddMoneyViewInput {
    
}
