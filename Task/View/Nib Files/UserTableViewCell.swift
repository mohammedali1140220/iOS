//
//  UserTableViewCell.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Name: UserTableViewCell
// Used: Define cell for photos table view 

// define libraries 
import UIKit

// define class UserTableViewCell as UITableViewCell
class UserTableViewCell: UITableViewCell {

    // define IBOutlet variable to binding data 
    @IBOutlet weak var userName: UILabel!
    
    // define IBOutlet variable to binding data 
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
    Name: handleCell
    Parameters: cell: UserTableViewCell, indexPathRaw: Int, users: [Users]
    Return: UITableViewCell
    Used: handle each cell for each index path and return the cell 
    **/
    func handleCell(cell: UserTableViewCell, indexPathRow: Int, users: [User]) -> UITableViewCell{
        
        // define the user of current index path
        let user = users[indexPathRow]
        
        // put the user name 
        cell.userName.text = user.name
        
        // put the user email 
        cell.userEmail.text = user.email
        
        // return cell
        return cell
    }
    
}
