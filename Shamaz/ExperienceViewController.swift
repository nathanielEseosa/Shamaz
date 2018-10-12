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
    let randomIndex = Int.random(in: 0...3)
    

    

    
    @IBOutlet weak var selectedTimelineLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTimelineLabel.text = "Share your \(selectedTimeline) experience!"
        generateExperience()
        
    }
    
    @IBAction func dismissy(_ sender: UIButton) {
        let randomIndexForPlayer = Int.random(in: 1...10)
        playerLabelText = "Player \(randomIndexForPlayer), choose a timeline:"
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func generateExperience() {
        if selectedTimeline == "future" {
            experienceLabel.text = experienceBankInstance.futureExperience[randomIndex]
        } else if selectedTimeline == "past" {
            experienceLabel.text = experienceBankInstance.pastExperience[randomIndex]
        }
    }
    

}
