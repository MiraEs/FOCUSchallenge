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
        playerName.text = "Name: \(currentPlayer.name)"
        playerWeight.text = "Weight (lbs): \(currentPlayer.weight)"
        playerAge.text = "Age: \(currentPlayer.age)"
        playerHeight.text = "Height (cm) \(currentPlayer.height)"
        playerCountry.text = "From: \(currentPlayer.country)"
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let dvc = segue.destination as? EditPlayerViewController
            dvc?.currentPlayerEdit = currentPlayer
        }
    }

}
