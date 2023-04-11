//
//  SceneDelegate.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: StartScreenViewController())
        window.makeKeyAndVisible()
        self.window = window
    }
}

