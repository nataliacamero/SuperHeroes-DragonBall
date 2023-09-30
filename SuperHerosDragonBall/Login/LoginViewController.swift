//
//  LoginViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 28/9/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let model = NetworkModel()//Inicializndo el modelo
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        model.login(
            user: usernameTextField.text ?? "",
            password: passwordTextField.text ?? ""
        ) { [weak self] result in
            switch result {
                case let .success(token):
                    print("Token: \(token).")
                    self?.model.getHeroes { result in
                            switch result {
                                case let .success(heroes):
                                    print("Heroes: \(heroes)")
                                    DispatchQueue.main.async {
                                        let tableView = TableViewController()
                                        //self?.navigationController?.setViewControllers([tableView], animated: true)//Sin boton de back, ideal para login
                                        self?.navigationController?.show(tableView, sender: nil)//Con boton de back
                                    }
                                    if let hero = heroes.last {
                                        self?.model.getTransformations(
                                            for: hero
                                        ) { result in
                                            switch result {
                                            case let .success(transformations):
                                                print("Transformation: \(transformations)")
                                            case let .failure(error):
                                                print("Error: \(error) como te va")
                                            }
                                        }
                                    }
                                case let .failure(error):
                                    print("Error: \(error): Hola")
                                    }
                            }
                
              
                case let .failure(error):
                    print("Error: \(error) Adios")
            }
            
        }
        
        		
        
    }


}
