//
//  Grades.swift
//  Grade App
//
//  Created by Yavuz Güner on 11.05.2022.
//

import Foundation


class Grades {
    var grade_id:Int?
    var course_name : String?
    var grade1:Int?
    var grade2:Int?
    
    init() {
        
    }
    
    init(grade_id:Int,course_name:String,grade1:Int,grade2:Int) {
        self.grade_id = grade_id
        self.course_name = course_name
        self.grade1 = grade1
        self.grade2 = grade2
    }
}
