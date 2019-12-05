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
        guard let countries = countries?[indexPath.row].borderCountries, let noCountries = self.countries?[indexPath.row] else {return}
        var borderCountries = [String]()
        
        if !countries.isEmpty {
            for country in countries {
                KPJCountryController.fetchCountries(fromName: country) { (countryName) in
                    print(countryName)
                    borderCountries.append(countryName)
                    if borderCountries.count == countries.count {
                        self.presentBorderCountriesAlert(borderCountries: borderCountries)
                    }
                }
            }
        } else {
            presentNoBorderCountriesAlert(country: noCountries.name)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func presentBorderCountriesAlert(borderCountries: [String]) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Border Countries", message: borderCountries.joined(separator: ", "), preferredStyle: .alert)
            let okay = UIAlertAction.init(title: "Thanks!", style: .default, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true)
        }
    }
    
    func presentNoBorderCountriesAlert(country: String) {
        let alert = UIAlertController(title: "No Bordering Countries!", message: "It looks like \(country) doesn't have any bordering countries.", preferredStyle: .alert)
        let okay = UIAlertAction.init(title: "Thanks!", style: .default, handler: nil)
        alert.addAction(okay)
        self.present(alert, animated: true)
    }
}
