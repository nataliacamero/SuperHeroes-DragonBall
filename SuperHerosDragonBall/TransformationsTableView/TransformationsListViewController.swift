//
//  TransformationsListViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 2/10/23.
//

import UIKit

class TransformationsListViewController: UIViewController {
    @IBOutlet weak var taleView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    
    var transformations: [TableViewCellRepresentable]
                                                            
    init(transformations: [Transformation]) {
        self.transformations = transformations
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transformaciones"
        taleView.dataSource = self
        taleView.delegate = self
        taleView.register(
            UINib(nibName: "TansformationsTableViewCell", bundle: nil),
            forCellReuseIdentifier: TansformationsTableViewCell.identifier
        )
        noDataLabel.text = "No hay transformaciones disponibles"
        noDataLabel.isHidden = !transformations.isEmpty

    }
}

//MARK: - Table View Datasource
extension TransformationsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TansformationsTableViewCell.identifier, for: indexPath) as? TansformationsTableViewCell else {
            return UITableViewCell()
        }
        let transformation = transformations[indexPath.row]
        cell.configure(with: transformation )
        return cell
    }
    
    
}
    

// MARK: - Table View Delegate
extension TransformationsListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

