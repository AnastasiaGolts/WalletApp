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
    
    private let textField = WalletAppTextField()
    private let button = WalletAppButton()
    private let stackView = UIStackView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpAppearance()
    }
    
}

// MARK: - AddMoneyViewInput

extension AddMoneyViewController: AddMoneyViewInput {
    func showEmptyAlert() {
        WalletAppAlert.showAlert(type: .emptyAdd, on: self)
    }
}

private extension AddMoneyViewController {
    
    // MARK: - Set Up Appearance
    
    func setUpAppearance() {
        setUpTextField()
        setUpButton()
        setUpStackView()
    }
    
    func setUpTextField() {
        textField.delegate = self
        textField.placeholder = L10n.AddMoneyScreen.placeholder
        textField.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        textField.addTarget(self, action: #selector(getValue(_:)), for: .editingChanged)
    }
    
    func setUpButton() {
        button.setTitle(L10n.General.addButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    func setUpStackView() {
        stackView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth - 60, height: 100)
        stackView.center.x = view.center.x
        stackView.center.y = view.center.y - 50
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        [textField, button].forEach {
            stackView.addArrangedSubview($0)
        }
        view.addSubview(stackView)
    }
    
    // MARK: - Actions
    
    @objc func submit() {
        output?.submit()
    }
    
    @objc func getValue(_ textField: UITextField) {
        output?.getAmountOfMoney(amount: textField.text)
    }
}

// MARK: - UITextField Delegate

extension AddMoneyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
