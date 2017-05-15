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
    let defaults = UserDefaults.standard
    let testVal = "test"
    let testKey = "testKey"
    let testKey2 = "testKey2"
    let testDict = [
                    ["player": "test1a", "name":"test2a"],
                    ["player": "test1b", "name":"test2b"]
                ]
    
    var testObject = [Player]()
    let newPlayer = Player(name: "somedude", country: "country", height: "height", weight: "l", age: "12")
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.set(testVal, forKey: testKey)
        
        ref = FIRDatabase.database().reference()
        //writeToFb()
        readFromFb()
    }

    
    func writeToFb() {
        let value = [
            "Name": "name1",
            "Country": "country1",
            "Weight": "weight1"
        ]
        
        self.ref.child("Players").childByAutoId().setValue(value)
    }
    
    func readFromFb() {
        self.ref.child("Players").observeSingleEvent(of: .value, with: { (snapshot) in
            if let allPlayers = snapshot.value as? [String: Any] {
                for player in allPlayers {
                    let val = player.value as! [String: String]
                    if let name = val["Name"],
                        let country = val["Country"],
                        let weight = val["Weight"] {
                    let playerAppend = Player(name: name, country: country, height: "", weight: weight, age: "")
                        dump("appending Player >>> \(playerAppend)")
                        self.testObject.append(playerAppend)
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
        
        return testObject.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
       cell.textLabel?.text = testObject[indexPath.row].name
        return cell
    }
 

   

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
