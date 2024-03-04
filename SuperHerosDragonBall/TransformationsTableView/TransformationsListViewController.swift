//
//  TransformationsListViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 2/10/23.
//

import UIKit

class TransformationsListViewController: UIViewController {
    @IBOutlet weak var taleView: UITableView!
    
    var transformations2: [TableViewCellRepresentable] = [
        Transformation(
            id: "14BB8E98-6586-4EA7-B4D7-35D6A63F5AA3",
            name: "Maestro Roshi",
            photo: URL(string: "https://cdn.alfabetajuega.com/alfabetajuega/2020/06/Roshi.jpg?width=300")!,
            description: "Es un maestro de artes marciales que tiene una escuela, donde entrenará a Goku y Krilin para los Torneos de Artes Marciales. Aún en los primeros episodios había un toque de tradición y disciplina, muy bien representada por el maestro. Pero Muten Roshi es un anciano extremadamente pervertido con las chicas jóvenes, una actitud que se utilizaba en escenas divertidas en los años 80. En su faceta de experto en artes marciales, fue quien le enseñó a Goku técnicas como el Kame Hame Ha"
        ), 
        Transformation(
            id: "14BB8E98-6586-4EA7-B4D7-35D6A63F5AA3",
            name: "Maestro Roshi",
            photo: URL(string: "https://cdn.alfabetajuega.com/alfabetajuega/2020/06/Roshi.jpg?width=300")!,
            description: "Es un maestro de artes marciales que tiene una escuela, donde entrenará a Goku y Krilin para los Torneos de Artes Marciales. Aún en los primeros episodios había un toque de tradición y disciplina, muy bien representada por el maestro. Pero Muten Roshi es un anciano extremadamente pervertido con las chicas jóvenes, una actitud que se utilizaba en escenas divertidas en los años 80. En su faceta de experto en artes marciales, fue quien le enseñó a Goku técnicas como el Kame Hame Ha"
        ),
        Transformation(
            id: "14BB8E98-6586-4EA7-B4D7-35D6A63F5AA3",
            name: "Maestro Roshi",
            photo: URL(string: "https://cdn.alfabetajuega.com/alfabetajuega/2020/06/Roshi.jpg?width=300")!,
            description: "Es un maestro de artes marciales que tiene una escuela, donde entrenará a Goku y Krilin para los Torneos de Artes Marciales. Aún en los primeros episodios había un toque de tradición y disciplina, muy bien representada por el maestro. Pero Muten Roshi es un anciano extremadamente pervertido con las chicas jóvenes, una actitud que se utilizaba en escenas divertidas en los años 80. En su faceta de experto en artes marciales, fue quien le enseñó a Goku técnicas como el Kame Hame Ha"
        )
    ]
    
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

