//
//  LoadMoreTableViewCell.swift
//  Task
//
//  Created by Ghaleb Khaled on 9/14/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Name: LoadMoreTableViewCell
// Used: add indicator to the table view

import UIKit

class LoadMoreTableViewCell: UITableViewCell {

    // define indicator IBOutlet variable
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // start animating data
        self.indicator.startAnimating()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
