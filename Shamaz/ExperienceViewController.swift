//
//  ExperienceViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 10.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

protocol SetPlayerNumberLabelTextDelegate: class {
    func setPlayerNumber(text: String)
}

class ExperienceViewController: UIViewController {
    
    weak var delegate: SetPlayerNumberLabelTextDelegate?
    
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
        let randomPlayerNumber = Int.random(in: 1...globalVEnteredPlayerNumber)
        delegate?.setPlayerNumber(text: "Player \(randomPlayerNumber), choose a timeline:")
        self.navigationController?.popViewController(animated: true)
    }
    
    func generateExperience() {
        if selectedTimeline == "future" {
            experienceLabel.text = experienceBankInstance.futureExperience[randomIndexForExperienceArray]
        } else if selectedTimeline == "past" {
            experienceLabel.text = experienceBankInstance.pastExperience[randomIndexForExperienceArray]
        }
    }
}
