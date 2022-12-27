//
//  TransactionScreenViewController.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class TransactionScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    var output: TransactionScreenViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func returnToMainScreen() {
        output?.returnToMainScreen()
    }
}

extension TransactionScreenViewController: TransactionScreenViewInput {

}
