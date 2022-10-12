//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Edgar Sánchez Hurtado on 4/10/22.
//

import UIKit


class ViewController: UITableViewController {
    var currentSTDSquadMembers : [String] = []
    
    let originalSTDSquadMembers = [
        "Adrian",
        "Sergio",
        "Robe",
        "Edgar",
        "Carles",
        "Hector"
    ]
    
    let newSTDSquadMembers = ["Damian", "Alberto"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentSTDSquadMembers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "squadMemberCell", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = currentSTDSquadMembers[indexPath.row]
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentSTDSquadMembers = originalSTDSquadMembers
        refreshControl = getRefreshControl()
    }
    
    private func getRefreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshSquadMembers(_:)), for: .valueChanged)
        return refreshControl
    }
    
    @objc private func refreshSquadMembers(_ sender: Any) {
        let membersToRemove = ["Adrian", "Sergio", "Robe"]
        currentSTDSquadMembers += newSTDSquadMembers
        currentSTDSquadMembers = currentSTDSquadMembers.filter { !membersToRemove.contains($0) }
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }


}

