//
//  PhotosViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import UIKit
import Alamofire

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [Photo] = []
    var photo = Photo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setupPhotos()
        let nib = UINib(nibName : "PhotoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PhotoTableViewCell")
        
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupPhotos(){
        Alamofire.request(APIRouter.getPhotos).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                if let responseData = response.result.value as? [Dictionary<String, AnyObject>]{
                    
                    let count = responseData.count
                    
                    for i in 0 ... count-1 {
                        print(responseData[0])
                        let photo = Photo(response: responseData[i] as NSDictionary)
                        self.photos.append(photo)
                    }
                    self.tableView.reloadData()
                    
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return photos.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let label = UILabel()
        
        view.addSubview(label)
        label.text = String(section)
        
        view.backgroundColor = .red
        //view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30).isActive = true
        
        NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: self.tableView.frame.width).isActive = true

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 61.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
        
        return cell.handleCell(cell: cell, indexPathRow: indexPath.row, photos: photos)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.photo = self.photos[indexPath.row]
        performSegue(withIdentifier: "normalImage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PhotoViewController
        vc.photo = self.photo
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
