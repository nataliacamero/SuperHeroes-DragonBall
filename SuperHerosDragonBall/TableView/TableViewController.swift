//
//  TableViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 1/10/23.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var heroesArray: [Hero] = []
    
    init(heroesArray: [Hero]) {
        self.heroesArray = heroesArray
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        tableView.dataSource = self
        tableView.delegate = self
        //Registar nuesta celda
        tableView.register(
            UINib(nibName: "HeroesTableViewCell", bundle: nil),
            forCellReuseIdentifier: HeroesTableViewCell.identifier
        )

    }
    
}
            
// MARK: - Table View DataSource
extension TableViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return heroesArray.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeroesTableViewCell.identifier,
            for: indexPath
        ) as? HeroesTableViewCell else {
            return UITableViewCell()
        }
        let hero = heroesArray[indexPath.row ] 
        cell.configure(with: hero as TableViewCellRepresentable )
        return cell
    }
}

// MARK: - Table View Delegate
extension TableViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let heroesDetail = heroesArray[indexPath.row]
        let datailViewController = DataViewController(hero: heroesDetail)
        navigationController?.show(datailViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




   


