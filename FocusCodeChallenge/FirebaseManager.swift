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
    private let childRef = "Players"
    
    private init() {}
    
    func getData(completion: @escaping ([Player]) -> Void){
        var players = [Player]()
        self.ref.child(childRef).observeSingleEvent(of: .value, with: { (snapshot) in
            if let allPlayers = snapshot.value as? [String: Any] {
                for player in allPlayers {
                    let val = player.value as! [String: String]
                    if let name = val["name"],
                        let country = val["country"],
                        let weight = val["weight"],
                        let height = val["height"],
                        let age = val["age"],
                        let id = val["id"] {
                        let playerAppend = Player(name: name, country: country, height: height, weight: weight, age: age, id: id)
                        players.append(playerAppend)
                    }
                }
            }
            completion(players)
        })
    }
    
    
    func addPlayer(_ player: [String: String], id: String) {
        let reference = self.ref.child(childRef).child("\(id)")
        reference.setValue(player)
    }
    
    func updatePlayer(_ player: [String: String], id: String) {
        self.ref.child(childRef).child(id).updateChildValues(player)
    }
    
    func deletePlayer(_ id: String) {
        self.ref.child(childRef).child(id).removeValue()
    }
    
}
