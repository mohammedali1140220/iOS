//
//  UserTableViewCell.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func handleCell(cell: UserTableViewCell, indexPathRow: Int, users: [User]) -> UITableViewCell{
        
        let user = users[indexPathRow]
        
        cell.userName.text = user.name
        cell.userEmail.text = user.email
        
        return cell
    }
    
}
