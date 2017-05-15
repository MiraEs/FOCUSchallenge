//
//  BasketballTableViewController.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/12/17.
//
//

import UIKit
import FirebaseDatabase

class BasketballTableViewController: UITableViewController {
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromFb()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //readFromFb()
    }
    
    func readFromFb() {
        
        FirebaseManager.manager.getData { (allPlayers) in
            self.players = allPlayers
            self.tableView.reloadData()
        }
        
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return players.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        let thisPlayer = players[indexPath.row]
        cell.textLabel?.text = "\(thisPlayer.name) of \(thisPlayer.country)"
        cell.detailTextLabel?.text = "Age: \(thisPlayer.age)"
        
        return cell
    }
}
