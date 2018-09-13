//
//  PhotoTableViewCell.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageThumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func handleCell(cell: PhotoTableViewCell, indexPathRow: Int, photos: [Photo]) -> UITableViewCell{
        
        let photo = photos[indexPathRow]
        
        cell.title.text = photo.title
        cell.imageThumb.sd_setImage(with: URL(string: photo.thumbnilURL), placeholderImage: UIImage(named: "Landing.png"))
        
        return cell
    }
    
    
}
