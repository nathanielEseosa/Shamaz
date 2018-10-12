//
//  ExperienceViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 10.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit



class ExperienceViewController: UIViewController {
    
    var selectedTimeline = ""
    let experienceBankInstance = ExperienceBank()
    let randomIndexForExperienceArray = Int.random(in: 0...3)
    
    
    @IBOutlet weak var selectedTimelineLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTimelineLabel.text = "Share your \(selectedTimeline) experience!"
        generateExperience()
        
    }
    
    @IBAction func dismissExprienceVC(_ sender: UIButton) {
        globalVPlayerLabelText = "Player \(globalVRandomIndexForPlayer), choose a timeline:"
        performSegue(withIdentifier: "segueBackwardToMainPageVC", sender: self)
        
    }
    
    func generateExperience() {
        if selectedTimeline == "future" {
            experienceLabel.text = experienceBankInstance.futureExperience[randomIndexForExperienceArray]
        } else if selectedTimeline == "past" {
            experienceLabel.text = experienceBankInstance.pastExperience[randomIndexForExperienceArray]
        }
    }
    

}

// Dismiss function in ExperienceVC (line 30) no longer works because of navigation controller?

