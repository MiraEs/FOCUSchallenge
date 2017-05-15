//
//  EditPlayerViewController.swift
//  FocusCodeChallenge
//
//  Created by Ilmira Estil on 5/14/17.
//
//

import UIKit

class EditPlayerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    var currentPlayerEdit: Player!
    var countryCategories = ["France🇫🇷", "Germany🇩🇪", "USA🇺🇸", "Spain🇪🇸", "Australia🇦🇺"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer()
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryPicker.selectRow(countryCategories.index(of: countryTextField.text!)!, inComponent: 0, animated: true)
    }
    
    func currentPlayer() {
        nameTextField.text = currentPlayerEdit.name
        countryTextField.text = currentPlayerEdit.country
        heightTextField.text = "\(currentPlayerEdit.height) cm"
        ageTextField.text = "\(currentPlayerEdit.age) years"
        weightTextField.text = "\(currentPlayerEdit.weight) lbs"
    }
    
    @IBAction func updatePlayerData(_ sender: UIButton) {
        if isEmptyField() {
            let alert = ErrorAlert.manager.alert(.bad, title: "Oh no!", message: "Make sure all fields are filled!")
            self.present(alert, animated: true, completion: nil)
            
        } else {
            print("not")
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
                let alert = ErrorAlert.manager.alert(.good, title: "Succesful Update!", message: "Added new player info.")
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func isEmptyField() -> Bool {
        let fields = [nameTextField.text, heightTextField.text, weightTextField.text, ageTextField.text, countryTextField.text]
        return fields.filter({($0?.isEmpty)!}).count > 0
        
    }
    
    @IBAction func touchedCountryField(_ sender: UITextField) {
        print("tapped")
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.countryPicker.isHidden = false
    }
    //MARK: - Picker Delegate
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
        self.countryTextField.text = countryCategories[row]
    }
    
}
