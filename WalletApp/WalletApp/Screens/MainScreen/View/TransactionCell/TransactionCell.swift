//
//  TransactionCell.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class TransactionCell: UITableViewCell {
    
    static let identifier = "transactionCellIdentifier"
    
    // MARK: - Properties
    
    private let transactionTypeLabel = UILabel()
    private let amountLabel = UILabel()
    
    private let labelConstant = Constants.screenWidth / 2

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setUpTransactionTypeLabel()
        setUpAmountLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(transactionModel: TransactionModel) {
        let date = transactionModel.timeOfTransaction.dropLast(3)
        let amount = transactionModel.amount
        
        if transactionModel.transactionType == "Added money" {
            amountLabel.text = "+\(amount)$"
            amountLabel.textColor = .red
        } else {
            amountLabel.text = "-\(amount)$"
            amountLabel.textColor = .black
        }
        transactionTypeLabel.text = transactionModel.transactionType + "  \(date)"
    }
}

private extension TransactionCell {
    
    // MARK: - Set Up Appearance
    
    func setUpTransactionTypeLabel() {
        transactionTypeLabel.textAlignment = .right
        contentView.addSubview(transactionTypeLabel)
        
        transactionTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(transactionTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(transactionTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: labelConstant))
        constraints.append(transactionTypeLabel.topAnchor.constraint(equalTo: topAnchor))
        constraints.append(transactionTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpAmountLabel() {
        contentView.addSubview(amountLabel)
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -labelConstant))
        constraints.append(amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(amountLabel.topAnchor.constraint(equalTo: topAnchor))
        constraints.append(amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }

}
