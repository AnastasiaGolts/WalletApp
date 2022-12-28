//
//  WalletAppAlert.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import UIKit

final class WalletAppAlert: UIAlertController {
    
    static func showAlert(type: WalletAlertType, on viewController: UIViewController) {
        let strings = getMessageTitle(type: type)
        let alert = UIAlertController(title: strings.title,
                                      message: strings.message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}

private extension WalletAppAlert {
    static func getMessageTitle(type: WalletAlertType) -> (title: String, message: String) {
        switch type {
        case .emptyAmount:
            return ("How much did you spend?", "Please specify amount of spent money")
        case .emptyTransactionType:
            return ("What did you spent your money on?", "Please choose category")
        case .emptyAdd:
            return ("How much do you want to add?", "Please specify amount of money")
        }
    }
}
