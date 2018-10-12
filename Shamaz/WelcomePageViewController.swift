//
//  WelcomePageViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 12.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

//Global variables

var globalVPlayerLabelText = ""
var globalVPlayerNumbers = 0
let globalVRandomIndexForPlayer = Int.random(in: 1...globalVPlayerNumbers) // This variable onry runs once. Where those it stays or is it overriding in MainPageVC(Line 20)?

class WelcomePageViewController: UIViewController {


    @IBOutlet weak var playerNumbersTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func continueButtonPressed() {
        
        let playerNumbersTextFieldValue = playerNumbersTextField.text!
        globalVPlayerNumbers = Int(playerNumbersTextFieldValue) ?? 1
        print(globalVPlayerNumbers)
        
        
        performSegue(withIdentifier: "segueForwardToMainPageVC", sender: self)
    }
    

    

}
