//
//  GradeCellTableViewCell.swift
//  Grade App
//
//  Created by Yavuz Güner on 11.05.2022.
//

import UIKit

class GradeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var secondGradeLabel: UILabel!
    @IBOutlet weak var firstGradeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
