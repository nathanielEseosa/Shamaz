//
//  ViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 01.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit


class MainPageViewController: UIViewController {
    
    var selectedTimeline = ""
    
    @IBOutlet weak var playerLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let globalVRandomIndexForPlayer = Int.random(in: 1...globalVPlayerNumbers) // This runs whenever viewDidAppear. Does it override the globalVRandomIndexForPlayer in the WelcomePageVC(Line 15)
        playerLabel.text = "Player \(globalVRandomIndexForPlayer), choose a timeline:"
        print(globalVRandomIndexForPlayer)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func timelineButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            selectedTimeline = "future"
        } else if sender.tag == 2 {
            selectedTimeline = "past"
        }
        performSegue(withIdentifier: "segueToExperienceVC", sender: self)
    }
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToExperienceVC" {
            let destinationVC = segue.destination as! ExperienceViewController
            
            destinationVC.selectedTimeline = selectedTimeline
    
        }
    }

}




