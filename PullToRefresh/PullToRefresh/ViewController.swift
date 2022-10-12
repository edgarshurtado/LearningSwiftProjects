//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Edgar Sánchez Hurtado on 4/10/22.
//

import UIKit

class ViewController: UITableViewController {
    let stdSquadMembers = [
        "Adrian",
        "Sergio",
        "Robe",
        "Edgar",
        "Carles",
        "Hector"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stdSquadMembers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "squadMemberCell", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = stdSquadMembers[indexPath.row]
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

