//
//  PersonInfoCell.swift
//  practiceapp
//
//  Created by Michael Neas on 3/10/19.
//  Copyright © 2019 Farce Productions. All rights reserved.
//

import UIKit

class PersonInfoCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personWeightLabel: UILabel!
    @IBOutlet weak var personAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }	
    
    func setPerson(_ person: Person) {
        self.personNameLabel.text = person.name
        self.personWeightLabel.text = String(person.weight)
        self.personAgeLabel.text = String(person.age)
        self.personImageView.image = nil
    }

}
