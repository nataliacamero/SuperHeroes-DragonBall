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
    
    private let countries: [String] = ["España", "Colombia", "Venezuela"]
    
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
        title = "List of Heroes"
        tableView.dataSource = self
        tableView.delegate = self
        print("Heroes en TableView: \(heroesArray)")
        tableView.register(
            UINib(nibName: "TableViewCell", bundle: nil),
            forCellReuseIdentifier: TableViewCell.identifier
        ) //Registar nuesta celda

    }
    
}
            
// MARK: - Table View DataSource
extension TableViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return countries.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier:      "CellIdentifier", for: indexPath)
//        let country = countries[indexPath.row]
//        cell.textLabel?.text = country
//        return cell
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.identifier,
            for: indexPath
        ) as? TableViewCell else {
            return UITableViewCell()
        }
        let country = countries[indexPath.row]
        cell.configure(with: country)
        return cell
    }
}

// MARK: - Table View Delegate
extension TableViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let country = countries[indexPath.row]
        let datailViewController = DataViewController(country: country)
        navigationController?.show(datailViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




   


