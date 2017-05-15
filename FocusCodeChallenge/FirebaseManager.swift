//
//  DataUpdateManager.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/14/17.
//
//

import Foundation
import FirebaseDatabase

class FirebaseManager {
    static let manager = FirebaseManager()
    internal let ref: FIRDatabaseReference = FIRDatabase.database().reference()
    
    private init() {}
    
    func getData(completion: @escaping ([Player]) -> Void){
        var players = [Player]()
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
                        players.append(playerAppend)
                        //dump("in closure >> \(players)")
                    }
                }
            }
            dump("in closure >> \(players)")
            completion(players)
        })
    }
 
    
    func addPlayer(_ player: [String:String]) {
        self.ref.child("Players").childByAutoId().setValue(player)
    }

}
