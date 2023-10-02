//
//  DataViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 1/10/23.
//

import UIKit

class DataViewController: UIViewController {
    @IBOutlet weak var countryLabelText: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
   
    private let model = NetworkModel()//Inicializndo el modelo
    private var hero: Hero
   
    
    init(hero: Hero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = hero.name
        imageView.setImage(for: hero.photo)
        countryLabelText.text = hero.name
        descriptionLabel.text = hero.description
    }

    @IBAction func transformationsButtonTapped(_ sender: Any) {
        
        let transformationsListViewController = TransformationsListViewController(hero: hero)
        navigationController?.show(transformationsListViewController, sender: nil)
    }
    
}
