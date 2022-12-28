//
//  MainScreenView.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    var output: MainScreenViewOutput?
    
    private let balanceStackView = UIStackView()
    private let balanceLabel = WalletAppLabel()
    private let balanceButton = WalletAppButton()
    
    private let bitcoinTransactionStackView = UIStackView()
    private let bitcoinTransactionLabel = WalletAppLabel()
    private let bitcoinTransactionButton = WalletAppButton()
    
    private let tableView = UITableView()
    
    private let stackViewHeight = Constants.screenHeight * 0.75
    private let stackViewSideConstant = (Constants.screenWidth / 2) + 10
    
    private var arrayOfTransactions = [TransactionModel]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WalletApp"
        view.backgroundColor = .white
        
        setUpAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrayOfTransactions = output?.fetchTransactionData() ?? [TransactionModel]()
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

// MARK: - MainScreenViewInput

extension MainScreenViewController: MainScreenViewInput {
    
}

private extension MainScreenViewController {
    
    func setUpAppearance() {
        setUpBalanceLabel()
        setUpBalanceButton()
        setUpBalanceStackView()
        
        setUpBitcoinTransactionLabel()
        setUpBitcoinTransactionButton()
        setUpBitcoinTransactionStackView()
        
        setUpTableView()
    }
    
    // MARK: - Set Up BalanceStackView
    
    func setUpBalanceLabel() {
        balanceLabel.text = "My balance"
    }
    
    func setUpBalanceButton() {
        balanceButton.setTitle("Add money", for: .normal)
        balanceButton.addTarget(self, action: #selector(showAddMoneyScreen), for: .touchUpInside)
    }
    
    func setUpBalanceStackView() {
        balanceStackView.axis = .vertical
        balanceStackView.distribution = .fillEqually
        balanceStackView.spacing = 10
        [balanceLabel, balanceButton].forEach {
            balanceStackView.addArrangedSubview($0)
        }
        view.addSubview(balanceStackView)
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
       
        var constraints = [NSLayoutConstraint]()
        constraints.append(balanceStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(balanceStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(balanceStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -stackViewSideConstant))
        constraints.append(balanceStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -stackViewHeight))
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Set Up BitcoinTransactionStackView
    
    func setUpBitcoinTransactionLabel() {
        bitcoinTransactionLabel.text = "Bitcoin"
    }
    
    func setUpBitcoinTransactionButton() {
        bitcoinTransactionButton.setTitle("Add transaction", for: .normal)
        bitcoinTransactionButton.addTarget(self, action: #selector(showTransactionScreen), for: .touchUpInside)
    }
    
    func setUpBitcoinTransactionStackView() {
        bitcoinTransactionStackView.axis = .vertical
        bitcoinTransactionStackView.distribution = .fillEqually
        bitcoinTransactionStackView.spacing = 10
        [bitcoinTransactionLabel, bitcoinTransactionButton].forEach {
            bitcoinTransactionStackView.addArrangedSubview($0)
        }
        view.addSubview(bitcoinTransactionStackView)
        
        bitcoinTransactionStackView.translatesAutoresizingMaskIntoConstraints = false
       
        var constraints = [NSLayoutConstraint]()
        constraints.append(bitcoinTransactionStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(bitcoinTransactionStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: stackViewSideConstant))
        constraints.append(bitcoinTransactionStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(bitcoinTransactionStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -stackViewHeight))
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Set Up UITableView
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: balanceStackView.bottomAnchor, constant: 10))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Actions
    
    @objc func showTransactionScreen() {
        output?.showTransactionScreen()
    }
    
    @objc func showAddMoneyScreen() {
        output?.showAddMoneyScreen()
    }
}

// MARK: - TableView Delegate & DataSource

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.getNumberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let title = output?.getSectionName(section: section) else {
            return ""
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.identifier, for: indexPath) as? TransactionCell,
              let transactionModel = output?.getCellInfo(indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.setUpCell(transactionModel: transactionModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
