//
//  PlayerDetailViewController.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/12/17.
//
//

import UIKit

class PlayerDetailViewController: UIViewController {
    var currentPlayer: Player!
    
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerWeight: UILabel!
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerHeight: UILabel!
    @IBOutlet weak var playerCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentPlayer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadCurrentPlayer()
    }
    
    func loadCurrentPlayer() {
        self.navigationItem.title = currentPlayer.name
        playerName.text = currentPlayer.name
        playerWeight.text = currentPlayer.weight
        playerAge.text = currentPlayer.age
        playerHeight.text = currentPlayer.height
        playerCountry.text = currentPlayer.country
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let dvc = segue.destination as? EditPlayerViewController
            dvc?.currentPlayerEdit = currentPlayer
        }
    }

}
