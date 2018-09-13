//
//  PhotoViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Name: PhotoViewController
// Used to display the normal image 


// define libraries 
import UIKit
import SDWebImage


// define the class PhotoViewController
class PhotoViewController: UIViewController {

    // define IBoutlet for image view to display the image 
    @IBOutlet weak var photoImageView: UIImageView!
    
    // define photo that recived from the pervious view controller 
    var photo = Photo()
    
    // override view controller function
    override func viewDidLoad() {
        
        // call the super function
        super.viewDidLoad()
        
        // set the image using sdWebImage 
        photoImageView.sd_setImage(with: URL(string: photo.url), placeholderImage: UIImage(named: "Landing.png"))
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
