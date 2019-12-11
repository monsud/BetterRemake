//
//  SearchBarCell.swift
//  BetterRemake
//
//  Created by Davide Monsurrocco on 09/12/2019.
//  Copyright © 2019 monsud. All rights reserved.
//

import UIKit

class Search: UISearchBar {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

class SearchBarCell: UITableViewCell {

    @IBOutlet weak var searchBar: UISearchBar!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


