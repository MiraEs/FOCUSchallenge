//
//  EditPlayerViewController.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/14/17.
//
//

import UIKit

class EditPlayerViewController: UIViewController {
    var currentPlayerEdit: Player!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = currentPlayerEdit.name
        countryTextField.text = currentPlayerEdit.country
        heightTextField.text = currentPlayerEdit.height
        ageTextField.text = currentPlayerEdit.age
        weightTextField.text = currentPlayerEdit.weight
    }
    
    @IBAction func updatePlayerData(_ sender: UIButton) {
        if let name = nameTextField.text,
            let height = heightTextField.text,
            let weight = weightTextField.text,
            let age = ageTextField.text,
            let country = countryTextField.text {
            let updatePlayer = [
                "name": name,
                "height": height,
                "weight": weight,
                "age": age,
                "country": country
            ]
            
            FirebaseManager.manager.updatePlayer(updatePlayer, id: currentPlayerEdit.id)
        }
        
    }
    
    
    
}
