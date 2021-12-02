//
//  DetailsViewController.swift
//  DataUSA
//
//  Created by Илья Маркелов on 28.11.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var detailsLabel: UILabel!
    
    var dataState: DataState?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = dataState?.state
        if let population = dataState?.population, let year = dataState?.year {
            detailsLabel.text =
            """
            Population: \(String(population))
            
            Year: \(String(year))
            """
        }
    }
}
