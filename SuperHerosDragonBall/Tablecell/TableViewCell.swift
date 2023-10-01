//
//  TableViewCell.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 1/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell" //Idtificador de la celda, reUseIdntifier
    @IBOutlet weak var countryLabel: UILabel!
    
    func configure(with country: String) {
        countryLabel.text = country
    }
}
