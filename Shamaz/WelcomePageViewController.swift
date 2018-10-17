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
        // To prevent the app from crashing, safe unwrap is used to check if the textField contains any value before.
        if let enteredPlayerNumber = Int(textFieldForPlayerNumber.text!) {
            randomPlayerNumber = Int.random(in: 1...enteredPlayerNumber)
            globalVEnteredPlayerNumber = enteredPlayerNumber
        } else {
            // If the use didn't enter eny value
            randomPlayerNumber = 1
            globalVEnteredPlayerNumber = 1
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

    

}
