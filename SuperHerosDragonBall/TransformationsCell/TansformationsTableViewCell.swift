//
//  TansformationsTableViewCell.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 3/3/24.
//

import UIKit

class TansformationsTableViewCell: UITableViewCell {
    static let identifier = "TansformationsTableViewCell" //Identificador de la celda
    @IBOutlet weak var transformationImage: UIImageView!
    @IBOutlet weak var tansformationLabel: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    //MARK: - Metodo para configurar traer la data a la celda.
    func configure(with transformation: TableViewCellRepresentable) {
        transformationImage.setImage(for: transformation.photo)
        tansformationLabel.text = transformation.name
        descriptionText.text = transformation.description
    }
    
}
