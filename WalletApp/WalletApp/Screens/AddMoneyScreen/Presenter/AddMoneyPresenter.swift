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
    
    private var receivedAmount = ""
    
    init(output: AddMoneyModuleOutput, dataBase: DataBaseProtocol) {
        self.output = output
        self.dataBase = dataBase
    }
    
}

// MARK: - AddMoneyViewOutput

extension AddMoneyPresenter: AddMoneyViewOutput {
    func returnToMainScreen() {
        guard Double(receivedAmount) != nil else {
            view?.showEmptyAlert()
            return
        }
        output.returnToMain()
    }
    
    func getAmountOfMoney(amount: String?) {
        receivedAmount = amount ?? ""
    }
}
