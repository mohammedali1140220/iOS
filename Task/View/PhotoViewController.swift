//
//  PhotoViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoViewController: UIViewController {

    
    @IBOutlet weak var photoImageView: UIImageView!
    var photo = Photo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.sd_setImage(with: URL(string: photo.url), placeholderImage: UIImage(named: "Landing.png"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
