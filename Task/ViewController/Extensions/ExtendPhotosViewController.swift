//
//  ExtendPhotosViewController.swift
//  Task
//
//  Created by Ghaleb Khaled on 9/14/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Name: ExtendPhotosViewController
//
// Used: Define the table view functionality

// import libraries
import UIKit
import Alamofire

// extend to PhotosViewController
extension PhotosViewController: UITableViewDataSource, UITableViewDelegate{
    
    /*
     Name: setupTableView
     Used: make setup to table view
     **/
    func setupTableView(){
        // append table view to deleget protocol
        self.tableView.delegate = self
        // append table view to data source protocol
        self.tableView.dataSource = self
        
        // define nib from PhotoTableViewCell nib file
        let nib = UINib(nibName : "PhotoTableViewCell", bundle: nil)
        
        // register nib to table view
        self.tableView.register(nib, forCellReuseIdentifier: "PhotoTableViewCell")
        
        // define nib from LoadMoreTableViewCell nib file
        let loadMore = UINib(nibName: "LoadMoreTableViewCell", bundle: nil)
        
        // register loadMore to table view
        self.tableView.register(loadMore, forCellReuseIdentifier: "LoadMoreTableViewCell")
    }
    
    // define number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // if there is data return number of rows from dict albumIds with the key for each one
        if self.albumIds.count != 0 && section != 0 {
            return self.albumIds[String(section)]!
        }
            
        // if there is no data return 1 section
        else{
            return 1
        }
    }
    
    // return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // if there is no data return 1 section
        if self.photos.count == 0 {
            return 1
        }
        
        // else return the count of albumIds
        return self.albumIds.count
    }
    
    // define the view for the header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // define view
        let view = UIView()
        
        // if there is no data return empty view
        if self.photos.count == 0{
            return view
        }
        // define label will hold the name
        let label = UILabel()
        
        // add label as subview to the view
        view.addSubview(label)
        
        // fill the label
        if self.albumIds.count != 0 && section != 0 {
            label.text = String(albumId[section - 1 ])
        }
        
        // change the color
        view.backgroundColor = UIColor.cyan
        
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
        
        // return the height for section's header
        return 61.0
    }
    
    // function will return handled cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // if there is a data
        if self.photos.count != 0 {
            // define/ruser cell from dequeueReusableCell function
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
            
            // retunr cell from the function handle cell
            return cell.handleCell(cell: cell, indexPathRow: indexPath.row, photos: photos)
        }
        
        // if ther is no data
        // print the load more cell
        let loadMore = self.tableView.dequeueReusableCell(withIdentifier: "LoadMoreTableViewCell", for: indexPath) as! LoadMoreTableViewCell
        
        // return load more cell
        return loadMore
    }
    
    // function used to know which raw was selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // save the selected photo in photo
        self.photo = self.photos[indexPath.row]
        
        // preform segue with segue identifier normalImage
        performSegue(withIdentifier: "normalImage", sender: self)
    }
    
    // used to return the height for raw at index path
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // check if it need's to display load more cell and display it on all table view
        if photos.count == 0 {
            return self.tableView.frame.height
        }
        // return automatic diminsions
        return UITableViewAutomaticDimension
    }
    
    // used to put estimated height for raw at indexpaht
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // return estimated value
        return 80
    }
}
