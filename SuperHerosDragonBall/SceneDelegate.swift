//
//  SceneDelegate.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 28/9/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: scene)
        let loginViewController = LoginViewController() // Para que sea presentado.
        let navigationController = UINavigationController(rootViewController: loginViewController)
        window.rootViewController = navigationController // Para presentarlo en nuestro window
        window.makeKeyAndVisible() // Para que se haga visible
        self.window = window // Para hacer una referencia
        
    }




}

