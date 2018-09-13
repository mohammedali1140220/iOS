//
//  PhotosViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Class PhotosViewController as UIViewController and confirm to prtocols UITableViewDelegate and UITableViewDataSource
// used to display photos in group

// define libraries 
import UIKit
import Alamofire

// define the class
class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    // create IBoutlet to connect to table view
    @IBOutlet weak var tableView: UITableView!
    
    // define array of phtots to save all users from respons
    var photos: [Photo] = []
   
   // define user variable to save photo will send to next ViewController
    var photo = Photo()
    
   // override viewDidLoad function 
    override func viewDidLoad() {
       
       // call super view 
        super.viewDidLoad()
        
       // append table view to deleget protocol 
        self.tableView.delegate = self
       // append table view to data source protocol
        self.tableView.dataSource = self

        // get photos from api 
        self.setupPhotos()
       
       // define nib from PhotoTableViewCell nib file 
        let nib = UINib(nibName : "PhotoTableViewCell", bundle: nil)
       
       // register nib to table view 
        tableView.register(nib, forCellReuseIdentifier: "PhotoTableViewCell")
        
    }

   // unwind segue
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
   /*
   Name: setupPhotos
   Used: send request used Alamofire library, get request, handle it and save it in the array
   **/
    func setupPhotos(){
       
       // send request using Alamofire 
        Alamofire.request(APIRouter.getPhotos).responseJSON { response in
            
            // check the response result                                                  
            switch response.result {
               
            // case success
            case .success(let value):
                
               // check and save the response value as Dictionery
                if let responseData = response.result.value as? [Dictionary<String, AnyObject>]{
                    
                   // save the responseData.count
                    let count = responseData.count
                    
                    for i in 0 ... count-1 {
                        // define photo to save the data of the photo 
                        let photo = Photo(response: responseData[i] as NSDictionary)
                       
                       // append the photo to the array 
                        self.photos.append(photo)
                    }
                   
                   // reload data when we finish the api handling 
                    self.tableView.reloadData()
                    
                }
                
            // handle the failure case 
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
   // define number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
       // check the current section 
       // we only have one section (one albumId)
        if section == 0 {
            return photos.count
        }
        return 0
    }
    
   // return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
   // define the view for the header 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       // define view 
        let view = UIView()
       
       // define label will hold the name 
        let label = UILabel()
        
       // add label as subview to the view 
        view.addSubview(label)
       
       // fill the label 
        label.text = String(section)
        
       // change the color 
        view.backgroundColor = .red
       
       // set translatesAutoresizingMaskIntoConstraints to label equal false 
        label.translatesAutoresizingMaskIntoConstraints = false
       
       // add constraint center x  to label 
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0).isActive = true
       // add constraint center y to label
       NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
       // add constraint wisht to view 
       NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
       // add consratin height to view  
       NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30).isActive = true
        // add constraint wisdth equal to table view width 
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: self.tableView.frame.width).isActive = true

       // return view 
        return view
    }

   // funstion will return the height for header section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 61.0
    }
    
   // function will return handled cell 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       // define/ruser cell from dequeueReusableCell function
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
        
       // retunr cell from the function handle cell
        return cell.handleCell(cell: cell, indexPathRow: indexPath.row, photos: photos)
    }
    
   // function used to know which raw was selected 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // save the selected photo in photo
        self.photo = self.photos[indexPath.row]
       
       // preform segue with segue identifier normalImage
        performSegue(withIdentifier: "normalImage", sender: self)
        
    }
    
   // define prepare function to send infromation to next view controller 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       // define the next view controller as vc 
        let vc = segue.destination as! PhotoViewController
       
       // send data to next view controller 
        vc.photo = self.photo
        
    }
    
   // used to return the height for raw at index path 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
       // return automatic diminsions 
        return UITableViewAutomaticDimension
    }
    
   // used to put estimated height for raw at indexpaht 
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
       
       // return estimated value 
        return 80
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
