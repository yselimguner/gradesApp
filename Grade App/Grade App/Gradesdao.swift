//
//  Gradesdao.swift
//  Grade App
//
//  Created by Yavuz Güner on 11.05.2022.
//

import Foundation

class Gradesdao {
    let db:FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("Grades.db")
        
        db = FMDatabase(path: dbURL.path)
    }
    
    func takeAllGrades() -> [Grades] {
        var list = [Grades]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM grades" , values: nil)
            while rs.next() {
                let grade = Grades(grade_id: Int(rs.string(forColumn: "grade_id"))!,
                                   course_name: rs.string(forColumn: "course_name")!,
                                   grade1: Int(rs.string(forColumn: "grade1"))!,
                                   grade2: Int(rs.string(forColumn: "grade2"))!)
                list.append(grade)
            }
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return list
    }
    
    func addGrade(course_name:String,grade1:Int,grade2:Int){
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO grades (course_name,grade1,grade2) VALUES (?,?,?) ", values: [course_name,grade1,grade2])
            }
         catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func editGrade(grade_id:Int,course_name:String,grade1:Int,grade2:Int){
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE grades SET course_name = ?, grade1 = ?, grade2 = ? WHERE grade_id = ?", values: [course_name,grade1,grade2,grade_id])
        }
        catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    func deleteGrade(grade_id:Int){
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM grades WHERE grade_id = ?", values: [grade_id])
        }
        catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
    }

    
}
