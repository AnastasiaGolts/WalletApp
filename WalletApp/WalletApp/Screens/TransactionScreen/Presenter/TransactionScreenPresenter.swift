//
//  TransactionScreenPresenter.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

final class TransactionScreenPresenter {
    
    // MARK: - Properties
    
    weak var view: TransactionScreenViewInput?
    
    private let output: TransactionScreenModuleOutput
    private let dataBaseService: DataBaseProtocol
    
    init(output: TransactionScreenModuleOutput, dataBaseService: DataBaseProtocol) {
        self.dataBaseService = dataBaseService
        self.output = output
    }

}

extension TransactionScreenPresenter: TransactionScreenViewOutput {
    func returnToMainScreen() {
        output.returnToMainModule()
    }
}
