//
//  PhotoTableViewCell.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Name: PhotoTableViewCell
// Used to define the cell that will display photo


// define libraries 
import UIKit

// define class PhotoTableViewCell as type of UITableViewCell
class PhotoTableViewCell: UITableViewCell {

    // define IBOutlet variable to binding data 
    @IBOutlet weak var title: UILabel!
    
    // define IBOutlet variable to binding data
    @IBOutlet weak var imageThumb: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
    Name : handleCell
    Parameters : cell, IndexPathRaw, phtots
    Return: UITableViewCell
    Used: handle each cell before display it 
    **/
    func handleCell(cell: PhotoTableViewCell, indexPathRow: Int, photos: [Photo]) -> UITableViewCell{
        
        // define photo
        let photo = photos[indexPathRow]
        
        // define cell title 
        cell.title.text = photo.title
        
        // define cell thumbnail using sdWebImage
        cell.imageThumb.sd_setImage(with: URL(string: photo.thumbnilURL), placeholderImage: UIImage(named: "Landing.png"))
        
        // return cell
        return cell
    }
    
    
}
