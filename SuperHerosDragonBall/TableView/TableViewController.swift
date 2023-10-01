//
//  TableViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 1/10/23.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let countries: [String] = ["España", "Colombia", "Venezuela"]
            
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of Heroes"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }
    
}
            
// MARK: - Tale View DataSource
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country
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




   


