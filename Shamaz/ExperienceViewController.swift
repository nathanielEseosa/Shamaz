//
//  ExperienceViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 10.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController {
    
    let selectedExperience : String = ""
    
    @IBOutlet weak var selectedExperienceLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func dismissy(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
