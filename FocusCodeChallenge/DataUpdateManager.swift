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
    
    func addPlayer(_ player: [String:String]) {
        self.ref.child("Players").childByAutoId().setValue(player)
    }
}
