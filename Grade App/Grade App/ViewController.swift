//
//  ViewController.swift
//  Grade App
//
//  Created by Yavuz Güner on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var gradeList = [Grades]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyDatabase()
        
        tableView.delegate = self
        tableView.dataSource = self        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gradeList = Gradesdao().takeAllGrades()
        
        var total = 0
        for g in gradeList {
            total = total + (g.grade1! + g.grade2!)/2
        }
        
        if gradeList.count != 0 {
            navigationItem.prompt = "Average : \(total / gradeList.count)"
        }else {
            navigationItem.prompt = "Average : None"
        }
        
        tableView.reloadData() // Arayüzümüz güncellenir.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        if segue.identifier == "toGradeDetail" {
            let toVC = segue.destination as! GradeDetailViewController
            
            toVC.grade = gradeList[indeks!]
        }
    }
    
    func copyDatabase () {
        let bundlePath = Bundle.main.path(forResource: "Grades", ofType: ".db")
        
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let copiedArea = URL(fileURLWithPath: targetPath).appendingPathComponent("Grades.db")
        
        if fileManager.fileExists(atPath: copiedArea.path) {
            print("Veritabanı zaten var kopyalamaya gerek yok.")
        }else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copiedArea.path)
            }catch {
                print(error.localizedDescription)
            }
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let grade = gradeList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! GradeCellTableViewCell
        
        cell.courseNameLabel.text = grade.course_name
        cell.firstGradeLabel.text = String(grade.grade1!)
        cell.secondGradeLabel.text = String(grade.grade2!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toGradeDetail", sender: indexPath.row)
    }
}
