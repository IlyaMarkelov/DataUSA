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
        
        navigationItem.title = dataState?.State
        if let population = dataState?.Population, let year = dataState?.Year {
            detailsLabel.text =
            """
            Population: \(String(population))
            
            Year: \(String(year))
            """
        }
    }
}
