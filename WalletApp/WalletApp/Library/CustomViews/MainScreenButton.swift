//
//  MainScreenButton.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

final class MainScreenButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(.white, for: .normal)
        backgroundColor = .red
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
