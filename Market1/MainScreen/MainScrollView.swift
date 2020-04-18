//
//  MainScrollView.swift
//  Market1
//
//  Created by Hershel Alterman on 2/28/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class MainScrollView: UIScrollView {
    var products: [PFObject]
    var productquery: PFQuery<PFObject>
    
    required override init(frame: CGRect){
        self.productquery = PFQuery(className:"Products")
        products = [PFObject(className:"Products")]
        //Products = []
        super.init(frame: frame)
        super.isPagingEnabled = true
        super.backgroundColor = .orange
    
        getProductList(query: productquery)
        setupPages()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        products = [PFObject(className:"Products")]
        self.productquery = PFQuery(className:"Products")

        super.init(coder: coder)
    }
    func getProductList(query: PFQuery<PFObject>) {
        
        let sv = UIViewController.displaySpinner(onView: self)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
        
                
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) Products.")
                // Do something with the found objects
                for object in objects {
                    print(object.objectId as Any)
                }
                self.products = objects
               
            
            }
            UIViewController.removeSpinner(spinner: sv)
        
            self.setupPages()
        
        }
     
    }
    
    
    
    func setupPages(){
        
        //Products = ["Item1", "Item2", "Item3", "Item4"]
    
        var numberOfPages :Int = products.count-1
        let pagestring : String = ""
        let padding : CGFloat = 3
        let viewWidth = self.frame.size.width - 2 * padding
        let viewHeight = self.frame.size.height - 2 * padding
        
        //For debug:
        //let colors = [UIColor.blue, UIColor.green,UIColor.purple, UIColor.yellow]
        var x : CGFloat = 0
        
        for p in products{
            let view: ProductView = ProductView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight) )
        
            view.Product = p["ProductName"] as? String ?? pagestring
            
            view.backgroundColor = UIColor.white
            view.setupProductView()
            //view.backgroundColor = colors[i]
            self.addSubview(view)
            
            x = view.frame.origin.x + viewWidth + padding
            
            super.contentSize = CGSize(width:x+padding, height: super.frame.size.height)
            
        }
        
        
        
        
        
        
        
        
        /*
         // Only override draw() if you perform custom drawing.
         // An empty implementation adversely affects performance during animation.
         override func draw(_ rect: CGRect) {
         // Drawing code
         }
         */
        
    }
}
