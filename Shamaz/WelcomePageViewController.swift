//
//  WelcomePageViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 12.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

// A global variable that stores the amount of players involde in the game. This variable allows the other view controllers to access the entered player numbers.
var globalVEnteredPlayerNumber = 0

class WelcomePageViewController: UIViewController {
    
    // A property that stores the number (generated randomly) of the next player
    var randomPlayerNumber = 0
    
    @IBOutlet weak var textFieldForPlayerNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func continueButtonPressed() {
        // To prevent the app from crashing, safe unwrap is used to check if the textField contains any value. It also checks if the user more than one player.
        
        if let enteredPlayerNumber = Int(textFieldForPlayerNumber.text!) {
            if enteredPlayerNumber > 1 {
                randomPlayerNumber = Int.random(in: 1...enteredPlayerNumber)
                globalVEnteredPlayerNumber = enteredPlayerNumber
            } else {
                alertForInvalidEntries()
            }
            
        } else {
                alertForInvalidEntries()
        }
        
        // Using the perfomSegue function to perfom a transition to the next view controller
        performSegue(withIdentifier: "segueToMainPageVC", sender: self)
    }
    
    // Using the "prepare for segue" method to set the value for the "textForNextPlayerLabel" property
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMainPageVC" {
            let destinationVC = segue.destination as! MainPageViewController
            
            destinationVC.textForNextPlayerLabel = "Player \(randomPlayerNumber), choose a timeline:"
            
        }
    }
    
    func alertForInvalidEntries() {
        let alert = UIAlertController(title: "", message: "Please enter a valid (min. 2 players) player number", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    

    

}
