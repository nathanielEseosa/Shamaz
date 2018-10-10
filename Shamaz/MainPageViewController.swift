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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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




