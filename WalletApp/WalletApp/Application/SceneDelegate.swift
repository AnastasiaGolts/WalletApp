//
//  SceneDelegate.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator.start()
        
        self.window = window
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        let previousVisitTime = UserDefaults.standard.getTimeOfLastVisit()
        if previousVisitTime != nil {
            if let previousVisitTime = previousVisitTime {
                let minutes = Date().minutes(from: previousVisitTime)
                if minutes > 59 {
                    UserDefaults.standard.setValueShouldUpdateBitcoin(value: true)
                    UserDefaults.standard.setTimeOfLastVisit(date: Date())
                } else {
                    UserDefaults.standard.setValueShouldUpdateBitcoin(value: false)
                }
            }
        } else {
            UserDefaults.standard.setTimeOfLastVisit(date: Date())
            UserDefaults.standard.setValueShouldUpdateBitcoin(value: true)
        }
    }

}

