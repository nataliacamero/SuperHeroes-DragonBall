//
//  DataViewController.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 1/10/23.
//

import UIKit

class DataViewController: UIViewController {
    @IBOutlet weak var countryLabelText: UILabel!
    
    
    private let country: String
    
    init(country: String) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = country
        countryLabelText.text = country
    }

    
}
