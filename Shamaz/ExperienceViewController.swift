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
    
    // The variable is used to call the method in the SetPlayerNumberLabelTextDelegate protocol.
    weak var delegate: SetPlayerNumberLabelTextDelegate?
    
    // This property stores a string value ("future" or "past").The property gets its value from the "prepare for segue" method in the MainPageViewController.
    var selectedTimeline = ""
    let experienceBankInstance = ExperienceBank()
    
    
    @IBOutlet weak var selectedTimelineLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedTimelineLabel.text = "Share your \(selectedTimeline) experience!"
        setExperienceArray()
        
    }
    
    @IBAction func dismissExprienceVC(_ sender: UIButton) {
        let randomPlayerNumber = Int.random(in: 1...globalVEnteredPlayerNumber)
        delegate?.setPlayerNumber(text: "Player \(randomPlayerNumber), choose a timeline:")
        self.navigationController?.popViewController(animated: true)
    }
    
    // This method picks the experience array depending on which timeline the user chooses.
    func setExperienceArray() {
        
        let maxAmountOfFutureExperiencesArray = experienceBankInstance.futureExperience.count
        let maxAmountOfPastExperienceArray = experienceBankInstance.pastExperience.count
        
        // This properties stores random numbers to randomly choose from their experience array
        let randomIndexForFutureExperienceArray = Int.random(in: 0..<maxAmountOfFutureExperiencesArray)
        let randomIndexForPastExperienceArray = Int.random(in: 0..<maxAmountOfPastExperienceArray)
        
        if selectedTimeline == "future" {
            experienceLabel.text = experienceBankInstance.futureExperience[randomIndexForFutureExperienceArray]
        } else if selectedTimeline == "past" {
            experienceLabel.text = experienceBankInstance.pastExperience[randomIndexForPastExperienceArray]
        }
    }
}
