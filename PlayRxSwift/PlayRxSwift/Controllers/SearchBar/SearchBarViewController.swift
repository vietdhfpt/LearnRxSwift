//
//  SearchBarViewController.swift
//  PlayRxSwift
//
//  Created by Do Hoang Viet on 8/5/19.
//  Copyright © 2019 Do Hoang Viet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchBarViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Searching..."
        return searchController
    }()
    
    let disposeBag = DisposeBag()
    
    var shownCities = [String]()
    let allCities = ["Oklahoma", "Chicago", "Moscow", "Danang", "Vancouver", "Praga"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        shownCities = allCities
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchController.searchBar.rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance) // Delay 0.5s when call API with new parameters
            .distinctUntilChanged() // Check query is same value
            .filter { !$0.isEmpty } // Filter query is not empty
            .subscribe(onNext: { query in
                self.shownCities = self.allCities.filter { $0.hasPrefix(query) }
                self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDataSource
extension SearchBarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        return cell
    }
}
