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
    
    private let textField = WalletAppTextField()
    private let pickerView = UIPickerView()
    private let addButton = WalletAppButton()
    
    private let stackView = UIStackView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpAppearance()
    }

}

// MARK: - TransactionScreenViewInput

extension TransactionScreenViewController: TransactionScreenViewInput {
    func showEmptyAmountAlert() {
        WalletAppAlert.showAlert(type: .emptyAmount, on: self)
    }
    
    func showEmptyTransactionTypeAlert() {
        WalletAppAlert.showAlert(type: .emptyTransactionType, on: self)
    }
}

private extension TransactionScreenViewController {
    
    // MARK: - Set Up Appearance
    
    func setUpAppearance() {
        setUpTextField()
        setUpPickerView()
        setUpAddButton()
        setUpStackView()
    }
    
    func setUpTextField() {
        textField.delegate = self
        textField.placeholder = "Spent amount of money"
        textField.addTarget(self, action: #selector(getValue(_:)), for: .editingChanged)
    }
    
    func setUpPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func setUpAddButton() {
        addButton.setTitle("Add transaction", for: .normal)
        addButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    func setUpStackView() {
        stackView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth - 60, height: 300)
        stackView.center.x = view.center.x
        stackView.center.y = view.center.y
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        [textField, pickerView, addButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        view.addSubview(stackView)
    }
    
    // MARK: - Actions
    
    @objc func submit() {
        output?.returnToMainScreen()
    }
    
    @objc func getValue(_ textField: UITextField) {
        output?.getAmountOfMoney(amount: textField.text)
    }
}

// MARK: - UIPickerView Delegate & DataSource

extension TransactionScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        TransactionType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        TransactionType.allCases[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        output?.getTransactionType(type: TransactionType.allCases[row])
    }
}

// MARK: - UITextField Delegate

extension TransactionScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


