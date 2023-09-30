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
        let viewController = LoginViewController() // Para que sea presentado.
        window.rootViewController = viewController // Para presentarlo en nuestro window
        window.makeKeyAndVisible() // Para que se haga visible
        self.window = window // Para hacer una referencia
        
    }




}

