//
//  ViewController.swift
//  Shamaz
//
//  Created by Nathaniel Idahosa on 01.10.18.
//  Copyright © 2018 Nathaniel Idahosa. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func pastButtonPressed() {
        performSegue(withIdentifier: "segueToExperienceVC", sender: self)
    }
    
    @IBAction func futureButtonPressed() {
        performSegue(withIdentifier: "segueToExperienceVC", sender: self)
    }


}

func selectedExperience() {
    
    
}
