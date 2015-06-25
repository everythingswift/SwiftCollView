//
//  ViewController.swift
//  SwiftCollView
//
//  Created by Sridhar Sanapala on 6/24/15.
//  Copyright (c) 2015 everythingswift. All rights reserved.
//

import UIKit

//#1 - This view controller implements UICollectionViewDataSource and UICollectionViewDelegate protocols
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

//#2 - An immutable array to hold color values
    let colorsArray = [UIColor.redColor(), UIColor.orangeColor(), UIColor.purpleColor(),
                        UIColor.blueColor(), UIColor.brownColor(), UIColor.blackColor(),
                        UIColor.darkGrayColor(), UIColor.lightGrayColor(), UIColor.greenColor()]
    
//#3 - An immutable array to hold color names
    let colorNamesArray = ["RED", "ORANGE", "PURPLE", "BLUE", "BROWN", "BLACK", "DARKGRAY", "LIGHTGRAY", "GREEN"]
  
//#4 - Overriding the viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//#5 - Overriding the didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//#6 - Returns the number of sections in the collection view - we hard coded it to 2
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }

//#7 - Returns the number of items in each section in the collection view - we are returning the number of items in the colorsArray
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsArray.count
    }

//#8 - We create a cell by dequeing it. The collection view cell's Reuse Identifier in the Main Storyboard has been configured using Interface builder. We deque that cell if available. Then assign a background color to the cell from the colors array we have.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{

        var cell:UICollectionViewCell!
        cell = collectionView.dequeueReusableCellWithReuseIdentifier("ColorCell", forIndexPath: indexPath) as! UICollectionViewCell
        cell.backgroundColor = colorsArray[indexPath.row]
        
        return cell
    }

//#9 - We return different sized collection view cells based on which section it belongs to.
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            if indexPath.section == 0{
                return CGSizeMake(100.0, 80.0)
            }

            return CGSizeMake(50.0, 50.0)
    }

//#10 - We're justing printing to log which section and row the tapped cell belongs to.
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        println("Collection View Cell tapped @ \(indexPath.section) and \(indexPath.row)")
    }
    
}