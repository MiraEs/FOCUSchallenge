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
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        readFromFb()
    }
    override func viewDidAppear(_ animated: Bool) {
        readFromFb()
    }
    
    func readFromFb() {
        self.ref.child("Players").observeSingleEvent(of: .value, with: { (snapshot) in
            if let allPlayers = snapshot.value as? [String: Any] {
                for player in allPlayers {
                    let val = player.value as! [String: String]
                    if let name = val["name"],
                        let country = val["country"],
                        let weight = val["weight"],
                        let height = val["height"],
                        let age = val["age"] {
                        let playerAppend = Player(name: name, country: country, height: height, weight: weight, age: age)
                        self.players.append(playerAppend)
                        self.tableView.reloadData()
                    }
                }
            }
        })
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
