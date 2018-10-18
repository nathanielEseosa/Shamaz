//
//  MainPageViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 01.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, SetPlayerNumberLabelTextDelegate {
    
    // This property is used to check when the protocol and delegate implementation should set the "nextPlayerLabel" label. If it is false, the "prepare for segue" method sets the label else the protocol and delegate implementation.
    var useDeleagteToSetLabel = false
    
    // This property stores a string value ("future" or "past") depending on the timeline the player chooses
    var timeline = ""
    
    // This property stores the text for the "nextPlayerLabel". The property gets its value from the "prepare for segue" method in the WelcomePageViewController
    var textForNextPlayerLabel = ""
    
    @IBOutlet weak var nextPlayerLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !useDeleagteToSetLabel {
            nextPlayerLabel.text = textForNextPlayerLabel
            useDeleagteToSetLabel = true
        }
    }

    @IBAction func timelineButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            timeline = "future"
        } else if sender.tag == 2 {
            timeline = "past"
        }
        performSegue(withIdentifier: "segueToExperienceVC", sender: self)
    }
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToExperienceVC" {
            let destinationVC = segue.destination as! ExperienceViewController
            
            destinationVC.selectedTimeline = timeline
            destinationVC.delegate = self
        }
    }
    
    func setPlayerNumber(text: String) {
        if useDeleagteToSetLabel {
            nextPlayerLabel.text = text
        }
    }
}
