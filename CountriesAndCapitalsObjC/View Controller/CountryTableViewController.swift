//
//  CountryTableViewController.swift
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        KPJCountryController.fetchCountries { (countries) in
            self.countries = countries
        }
    }
    
    var countries: [KPJCountry]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        cell.textLabel?.text = countries?[indexPath.row].name
        cell.detailTextLabel?.text = countries?[indexPath.row].capital
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let countries = countries?[indexPath.row].borderCountries else {return}
        let borderCountries = countries.joined(separator: ", ")
        let alert = UIAlertController(title: "Border Countries", message: borderCountries, preferredStyle: .alert)
        let okay = UIAlertAction.init(title: "Thanks!", style: .default, handler: nil)
        alert.addAction(okay)
        self.present(alert, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
