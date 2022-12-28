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
        let action = UIAlertAction(title: L10n.Alert.Action.ok, style: .default)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}

private extension WalletAppAlert {
    static func getMessageTitle(type: WalletAlertType) -> (title: String, message: String) {
        switch type {
        case .emptyAmount:
            return (L10n.Alert.EmptyAmount.title, L10n.Alert.EmptyAmount.message)
        case .emptyTransactionType:
            return (L10n.Alert.EmptyTransactionType.title, L10n.Alert.EmptyTransactionType.message)
        case .emptyAdd:
            return (L10n.Alert.EmptyAdd.title, L10n.Alert.EmptyAdd.message)
        }
    }
}
