//
//  MainScreenLabel.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class MainScreenLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = .black
        textAlignment = .center
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
