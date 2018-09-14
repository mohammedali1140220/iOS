//
//  PhotosViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Class PhotosViewController as UIViewController and confirm to prtocols UITableViewDelegate and UITableViewDataSource
// used to display photos in group

// import libraries
import UIKit
import Alamofire

// define the class
class PhotosViewController: UIViewController{
   
    // create IBoutlet to connect to table view
    @IBOutlet weak var tableView: UITableView!
    
    // define array of phtots to save all users from respons
    var photos: [Photo] = []
   
   // define user variable to save photo will send to next ViewController
    var photo = Photo()
    
    // define AlbumId
    // used to print the section title
    var albumId:[Int] = []
    
    // define dictionery of album id
    // used to count the number of items of each sections
    var albumIds: [String: Int] = [:]
    
   // override viewDidLoad function 
    override func viewDidLoad() {
       
       // call super view 
        super.viewDidLoad()
        
        // setup table view
        self.setupTableView()
        
        // get photos from api
        self.setupPhotos()
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
                    
                    // handle response data
                   self.handleResponseData(responseData: responseData)
                    
                   // reload data when we finish the api handling 
                    self.tableView.reloadData()
                }
            // handle the failure case 
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    /*
     Name: handleResponseData
     Parametes: responseData
     Used: Save response in photos array
     **/
    func handleResponseData(responseData: [Dictionary<String, AnyObject>]){
        
        // save the responseData.count
        let count = responseData.count
        
        // looping on the items
        for i in 0 ... count-1 {
            // define photo to save the data of the photo
            let photo = Photo(response: responseData[i] as NSDictionary)
            
            // append the photo to the array
            self.photos.append(photo)
        }
        // divide items into section
        self.getAlbumId(photos: self.photos)
    }
    
    /*
     Name: getAlbumId
     parameters : Array of Photo
     Used: Save the item in Dictionory in sections as key reference to number of elements for the same album Id
     **/
    func getAlbumId(photos: [Photo]){
        
        // define albumId as -1 (defualt init)
        var albumId = -1
        
        // define the count will counting the item with the same album id
        var count = 0
        
        // looping on the photos
        for photo in photos {
            
            // check albumId is different
            if albumId != photo.albumId{
                
                // reset the count when new there is a new albumId
                count = 0
                
                // add albumId to array albumID
                self.albumId.append(photo.albumId)
                
                // add albumId to albumIds dictionery
                self.albumIds[String(photo.albumId)] = 0
                
                // change the albumId var to new value
                albumId = photo.albumId
            }
            
            // increment the count
            count += 1
            
            // add items to dict albumIds
            self.albumIds[String(albumId)] = count
        }
    }
    
    
   
    // define prepare function to send infromation to next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // define the next view controller as vc
        let vc = segue.destination as! PhotoViewController
        
        // send data to next view controller
        vc.photo = self.photo
    }
    
    // unwind segue
    @IBAction func unWindSegue(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


