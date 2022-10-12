//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Edgar Sánchez Hurtado on 4/10/22.
//

import UIKit

enum mleanWorkers: String, CaseIterable {
    case Adrian, Sergio, Robe, Edgar, Carles, Hector, Damian, Alberto
}

class ViewController: UITableViewController {
    var currentSTDSquadMembers : [mleanWorkers] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentSTDSquadMembers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "squadMemberCell", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = currentSTDSquadMembers[indexPath.row].rawValue
        cell.contentConfiguration = contentConfiguration
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = getRefreshControl()
        currentSTDSquadMembers = [
            .Adrian,
            .Robe,
            .Sergio,
            .Edgar,
            .Hector,
            .Carles
        ]
    }
    
    private func getRefreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Uploading Squad Members", attributes: [.foregroundColor: UIColor.blue])
        refreshControl.addTarget(self, action: #selector(refreshSquadMembers(_:)), for: .valueChanged)
        return refreshControl
    }
    
    @objc private func refreshSquadMembers(_ sender: Any) {
        let notStdMembers: [mleanWorkers] = [.Adrian, .Sergio, .Robe]
        currentSTDSquadMembers = mleanWorkers.allCases.filter { !notStdMembers.contains($0) }
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
}

