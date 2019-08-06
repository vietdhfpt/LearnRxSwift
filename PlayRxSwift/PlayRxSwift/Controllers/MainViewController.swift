//
//  MainViewController.swift
//  PlayRxSwift
//
//  Created by Do Hoang Viet on 8/5/19.
//  Copyright © 2019 Do Hoang Viet. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchControlCell", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarCell", for: indexPath)
            return cell
        default:
            return defaultCell
        }
        
    }
}
