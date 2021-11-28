//
//  DataViewController.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//

import UIKit

class DataViewController: UITableViewController {
    
    var networkManager = NetworkManager()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        networkManager.fetchDataUSA {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        networkManager.dataUSA?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        if let data = networkManager.dataUSA?.data?[indexPath.row] {
            var content = cell.defaultContentConfiguration()
            content.text = data.State
            content.image = UIImage(systemName: "swift")
            cell.contentConfiguration = content
        }
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailsViewController else {return}
            detailsVC.dataState = networkManager.dataUSA?.data?[indexPath.row]
        }
    }
}
