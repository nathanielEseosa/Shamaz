//
//  MainPageViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 01.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, SetPlayerNumberLabelTextDelegate {
    func setPlayerNumber(text: String) {
        if useDeleagteToSetLabel {
            nextPlayerLabel.text = text
        }
    }
    
    var useDeleagteToSetLabel = false
    
    var timeline = ""
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
}
