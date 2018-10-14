//
//  WelcomePageViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 12.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

var globalVEnteredPlayerNumber = 0

class WelcomePageViewController: UIViewController {
    
    var randomPlayerNumber = 0
    
    @IBOutlet weak var textFieldForPlayerNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func continueButtonPressed() {
        if let enteredPlayerNumber = Int(textFieldForPlayerNumber.text!) {
            randomPlayerNumber = Int.random(in: 1...enteredPlayerNumber)
            globalVEnteredPlayerNumber = enteredPlayerNumber
        } else {
            randomPlayerNumber = 1
            globalVEnteredPlayerNumber = 1
        }
        
        performSegue(withIdentifier: "segueToMainPageVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMainPageVC" {
            let destinationVC = segue.destination as! MainPageViewController
            
            destinationVC.textForNextPlayerLabel = "Player \(randomPlayerNumber), choose a timeline:"
            
        }
    }

    

}
