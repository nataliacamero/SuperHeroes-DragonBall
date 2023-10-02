//
//  TransformationsListViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 2/10/23.
//

import UIKit

class TransformationsListViewController: UIViewController {
    @IBOutlet weak var transformationsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let model = NetworkModel()//Inicializndo el modelo
    
    private var hero: Hero
    
    private var transformations: [Transformation] = []
    
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
        title = "Transformaciones"
        tableView.dataSource = self
        tableView.delegate = self
        transformationsLabel.text = hero.name
        tableView.register(
            UINib(nibName: "HeroesTableViewCell", bundle: nil),
            forCellReuseIdentifier: HeroesTableViewCell.identifier
        )

        model.getTransformations(
                for: hero
            ) { result in
                switch result {
                    case let .success(transformations):
                        print("Transformation: \(transformations)")
                        self.transformations = transformations
                    case let .failure(error):
                        print("Error: \(error) como te va")
              }
            }
        }
}
    

// MARK: - Table View DataSource
extension TransformationsListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return transformations.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier:      "CellIdentifier", for: indexPath)
//        let country = countries[indexPath.row]
//        cell.textLabel?.text = country
//        return cell
//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: TableViewCell.identifier,
//            for: indexPath
//        ) as? TableViewCell else {
//            return UITableViewCell()
//        }
//        let country = countries[indexPath.row]
//        cell.configure(with: country)
//        return cell
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeroesTableViewCell.identifier,
            for: indexPath
        ) as? HeroesTableViewCell else {
            return UITableViewCell()
        }
        let transformation = transformations[indexPath.row]
        cell.configure(with: transformation as CommonInfo)
        return cell
    }
}

// MARK: - Table View Delegate
extension TransformationsListViewController: UITableViewDelegate {
//    func tableView(
//        _ tableView: UITableView,
//        didSelectRowAt indexPath: IndexPath
//    ) {
//        let transformationDetail = transformations[indexPath.row]
//        let transformationsListViewController = TransformationsListViewController(hero: transformationDetail as! CommonInfo)
//        navigationController?.show(transformationsListViewController, sender: nil)
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
}

