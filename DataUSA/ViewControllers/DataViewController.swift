//
//  DataViewController.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//

import UIKit
import Alamofire

class DataViewController: UITableViewController {
    
    private var dataState: [DataState] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//        fetchData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataState.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let data = dataState[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = data.state
            content.image = UIImage(systemName: "swift")
            cell.contentConfiguration = content
        
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailsViewController else {return}
            detailsVC.dataState = dataState[indexPath.row]
        }
    }
    
//    private func fetchData() {
//        AF.request(Link.dataUSAApi.rawValue)
//            .validate()
//            .responseJSON { dataResponse in
//                switch dataResponse.result {
//                case .success(let value):
//                    guard let dataUSA = value as? [String: Any] else {return}
//                    guard let dataUSAArray = dataUSA["data"] as? [Any] else {return}
//                    guard let dataStateArray = dataUSAArray as? [[String: Any]] else {return}
//                    for data in dataStateArray {
//                        let dataState = DataState(
//                            state: data["State"] as? String,
//                            year: data["Year"] as? String,
//                            population: data["Population"] as? Int
//                        )
//                        self.dataState.append(dataState)
//                    }
//                    self.tableView.reloadData()
//                    print(dataUSA)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
}
