//
//  HeroesTableViewCell.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 1/10/23.
//

import UIKit

class HeroesTableViewCell: UITableViewCell {
    static let identifier = "HeroesTableViewCell" //Identificador de la celda
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var descriptionHero: UILabel!
    
    
    //MARK: - Añadir chevrone derecha
    override func awakeFromNib() {
           super.awakeFromNib()
           self.accessoryType = .disclosureIndicator
       }
    
    //MARK: - Metodo para configurar traer la data a la celda.
    func configure(with heroe:  Hero ) {
        imageHero.setImage(for: heroe.photo)
        nameHero.text = heroe.name
        descriptionHero.text = heroe.description
    }
}
