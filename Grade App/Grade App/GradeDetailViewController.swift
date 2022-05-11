//
//  GradeDetailViewController.swift
//  Grade App
//
//  Created by Yavuz Güner on 11.05.2022.
//

import UIKit

class GradeDetailViewController: UIViewController {

    @IBOutlet weak var grade2TextField: UITextField!
    @IBOutlet weak var grade1TextField: UITextField!
    @IBOutlet weak var courseNameTextField: UITextField!
    
    var grade:Grades?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let g = grade {
            courseNameTextField.text = g.course_name
            grade1TextField.text = String(g.grade1!)
            grade2TextField.text = String(g.grade2!)
        }
        
        
        
    }
    
    @IBAction func editGradeButton(_ sender: Any) {
        if let g = grade, let name = courseNameTextField.text, let grade1 = grade1TextField.text, let grade2 = grade2TextField.text{
            if let g1 = Int(grade1), let g2 = Int(grade2) {
                Gradesdao().editGrade(grade_id: g.grade_id!, course_name:name , grade1: g1, grade2: g2)
            }
        }
    }
    @IBAction func deleteGradeButton(_ sender: Any) {
        if let g = grade {
            Gradesdao().deleteGrade(grade_id: g.grade_id!)
        }
    }
    

}
