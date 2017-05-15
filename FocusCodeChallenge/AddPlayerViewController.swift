//
//  AddPlayerViewController.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/12/17.
//
//

import UIKit

class AddPlayerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //🇫🇷🇩🇪🇺🇸🇪🇸🇦🇺
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    let fbManager = FirebaseManager.manager
    var playerCountry = String()
    var countryCategories = ["France🇫🇷", "Germany🇩🇪", "USA🇺🇸", "Spain🇪🇸", "Australia🇦🇺"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryPicker.dataSource = self
        countryPicker.delegate = self
    }
    
    func setPlayer() {
        if let name = nameTextField.text,
            let height = heightTextField.text,
            let weight = weightTextField.text,
            let age = ageTextField.text {
        let newPlayer = [
                "name": name,
                "height": height,
                "weight": weight,
                "age": age,
                "country": playerCountry
            ]
            fbManager.addPlayer(newPlayer)
        }
    }
    
    @IBAction func savePlayer(_ sender: UIButton) {
        setPlayer()
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Picker View Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryCategories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.playerCountry = countryCategories[row]
    }

}
