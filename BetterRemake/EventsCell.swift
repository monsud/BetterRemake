//
//  EventsCell.swift
//  BetterRemake
//
//  Created by Davide Monsurrocco on 09/12/2019.
//  Copyright © 2019 monsud. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {
    @IBOutlet weak var homeT: UILabel!
    @IBOutlet weak var awayT: UILabel!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var oneOdd: UILabel!
    @IBOutlet weak var xOdd: UILabel!
    @IBOutlet weak var twoOdd: UILabel!
    
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
