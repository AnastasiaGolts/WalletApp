//
//  AddMoneyPresenter.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

final class AddMoneyPresenter {
    
    // MARK: - Properties
    
    weak var view: AddMoneyViewInput?
    
    private let output: AddMoneyModuleOutput
    private let dataBase: DataBaseProtocol
    
    init(output: AddMoneyModuleOutput, dataBase: DataBaseProtocol) {
        self.output = output
        self.dataBase = dataBase
    }
    
}

extension AddMoneyPresenter: AddMoneyViewOutput {
    func returnToMainScreen() {
        output.returnToMain()
    }
}
