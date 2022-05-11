//
//  AddGradeViewController.swift
//  Grade App
//
//  Created by Yavuz Güner on 11.05.2022.
//

import UIKit

class AddGradeViewController: UIViewController {

    @IBOutlet weak var grade2Label: UITextField!
    @IBOutlet weak var grade1Label: UITextField!
    @IBOutlet weak var courseNameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  

    @IBAction func addButton(_ sender: Any) {
        if let name = courseNameLabel.text, let gr1 = grade1Label.text, let gr2 = grade2Label.text{
            if let g1 = Int(gr1), let g2 = Int(gr2) {
                Gradesdao().addGrade(course_name: name, grade1: Int(gr1)!, grade2: Int(gr2)!)
            }
        }
    }
}
