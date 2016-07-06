//
//  ViewController.swift
//  CollView
//
//  Created by apple on 23/05/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var players=[["name":"MS Dhoni","age":"34","matches":"285","highest_Score":"183","image_Name":"http://p.imgci.com/db/PICTURES/CMS/202600/202667.1.jpg"],
    ["name":"Shikhar Dhawan","age":"30","matches":"74","highest_Score":"137","image_Name":"http://p.imgci.com/db/PICTURES/CMS/202700/202705.1.jpg"],
    ["name":"Virat Kohli","age":"27","matches":" 171","highest_Score":" 183","image_Name":"http://1.bp.blogspot.com/-Y50vDhRD04U/UZkSuBbMdwI/AAAAAAAAAYs/AIXXnJCTWcA/s1600/Virat-Kohli.jpg"],
    ["name":"Suresh Raina","age":"29","matches":" 187","highest_Score":"120","image_Name":"http://p.imgci.com/db/PICTURES/CMS/128400/128475.1.jpg"],
    ["name":"Rohit Sharma","age":"30","matches":" 200","highest_Score":"263","image_Name":"http://p.imgci.com/db/PICTURES/CMS/222900/222915.jpg"],
    ["name":"Yuvraj Singh","age":"34","matches":" 311","highest_Score":"186","image_Name":"http://p.imgci.com/db/PICTURES/CMS/202600/202671.1.jpg"],
    ["name":"Ravi Jadeja","age":"28","matches":" 165","highest_Score":"89","image_Name":"http://p.imgci.com/db/PICTURES/CMS/202700/202757.1.jpg"],
    ["name":"Harbhajan Singh","age":"36","matches":"341","highest_Score":"80","image_Name":"http://p.imgci.com/db/PICTURES/CMS/128400/128477.1.jpg"],
    ["name":"Bhubneswar Kumar","age":"27","matches":"91","highest_Score":"30","image_Name":"http://p.imgci.com/db/PICTURES/CMS/202700/202765.icon.jpg"],
    ["name":"Ashish Nehra","age":"35","matches":"211","highest_Score":"21","image_Name":"http://p.imgci.com/db/PICTURES/CMS/128400/128480.1.jpg"]]
    
    @IBOutlet weak var mycall: UICollectionView!
    var selectedIndex=[Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:playerCell=collectionView.dequeueReusableCellWithReuseIdentifier("playerCell", forIndexPath: indexPath) as! playerCell
        
       //  cell.playerImage.image=UIImage(named:self.players[indexPath.row]["image_Name"]!)
        cell.name.text=self.players[indexPath.row]["name"]
        cell.matches.text="Matches :- "+self.players[indexPath.row]["matches"]!
        cell.highest.text="Highest :- "+self.players[indexPath.row]["highest_Score"]!
        
        let url=NSURL(string:self.players[indexPath.row]["image_Name"]!)
        cell.playerImage.af_setImageWithURL(url!, placeholderImage: nil, filter: nil,  imageTransition: .CrossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)
        
        if selectedIndex.contains(indexPath.row){
        
            cell.selectionView.hidden=false
            
        }else{
             cell.selectionView.hidden=true
        }
        
        
        return cell
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if selectedIndex.contains(indexPath.row){
            
        self.selectedIndex.removeAtIndex(self.selectedIndex.indexOf(indexPath.row)!)
            
        }else{
           self.selectedIndex.append(indexPath.row)
        }

        
    collectionView.reloadData()
        
        
           }
    
    
    
}

