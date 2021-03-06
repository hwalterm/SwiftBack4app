//
//  MainScrollView.swift
//  Market1
//
//  Created by Hershel Alterman on 2/28/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse


//Retrieve products from database and add to scroll view
class MainScrollView: UIScrollView {
    var relations: [PFObject]
    var producttype: String = ""
    var productquery: PFQuery<PFObject>
    let curruser = PFUser.current()!
    let profile:PFObject
    
    required override init(frame: CGRect){
        self.profile = self.curruser["Profile"] as! PFObject
        
        self.productquery = PFQuery(className: "UserProductJoin")
        relations = [PFObject(className:"UserProductJoin")]
        productquery.order(byDescending: "MatchNumber")
        productquery.includeKey("Product")
        //Products = []
        super.init(frame: frame)
        super.isPagingEnabled = true
        super.backgroundColor = .orange
        super.layer.cornerRadius = 8
        
        getProductList(query: productquery)
        setupPages()
        
        
        
        
    }
    init (frame: CGRect, ProductType: String){
        self.relations = [PFObject(className:"UserProductJoin")]
        self.producttype = ProductType
        
        self.profile = self.curruser["Profile"] as! PFObject
        //set up product query
        self.productquery = PFQuery(className: "UserProductJoin")
        
        //add product type constraint
        let innerProductQuery = PFQuery(className: "Products")
        innerProductQuery.whereKey("ProductType", equalTo: ProductType)
        print(ProductType)
        productquery.whereKey("Product", matchesQuery: innerProductQuery)
        productquery.whereKey("UserProfile", equalTo: profile)
        
        
        productquery.order(byDescending: "MatchNumber")
        
        //include related products when retrieving the relations
        productquery.includeKey("Product")
        //Products = []
        super.init(frame: frame)
        super.isPagingEnabled = true
        super.backgroundColor = .orange
        super.layer.cornerRadius = 8
        
        getProductList(query: productquery)
        setupPages()
        
    }
    
    required init?(coder: NSCoder) {
        self.profile = self.curruser["Profile"] as! PFObject
        
        //Set up query for desired products
        self.productquery = PFQuery(className: "UserProductJoin")
        
        
        productquery.order(byDescending: "MatchNumber")
        productquery.includeKey("Product")
        relations = [PFObject(className:"UserProductJoin")]
        super.init(coder: coder)
        super.isPagingEnabled = true
        super.backgroundColor = .orange
        super.layer.cornerRadius = 8
        getProductList(query: productquery)
        setupPages()
        
        
    }
    
    //Retrieve products from database
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
                    
                    //print("OBJECT: ")
                    print(object.objectId as Any)
                    let pr = object["Product"] as? PFObject
                    //print(pr as Any)
                }
                self.relations = objects
                
                
            }
            UIViewController.removeSpinner(spinner: sv)
            
            self.setupPages()
            
        }
        
    }
    
    func addDefaultPage(){
        let pagestring : String = ""
        let padding : CGFloat = 3
        let viewWidth = self.frame.size.width - 2 * padding
        let viewHeight = self.frame.size.height - 2 * padding
        var x : CGFloat = 0
        let view: ProductView = ProductView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight) )
        
        //view.Product = "Testtest"
        
        
        view.backgroundColor = UIColor.lightGray
        view.setupProductView()
        //view.backgroundColor = colors[i]
        self.addSubview(view)
        
        x = view.frame.origin.x + viewWidth + padding
        
        super.contentSize = CGSize(width:x+padding, height: super.frame.size.height)
        
    }
    
    func addProductPage(p: PFObject){
        
        //Products = ["Item1", "Item2", "Item3", "Item4"]
        
        var numberOfPages :Int = relations.count-1
        
        let pagestring : String = ""
        let padding : CGFloat = 3
        let viewWidth = self.frame.size.width - 2 * padding
        let viewHeight = self.frame.size.height - 2 * padding
        
        //For debug:
        //let colors = [UIColor.blue, UIColor.green,UIColor.purple, UIColor.yellow]
        var x : CGFloat = 0
        let view: ProductView = ProductView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight) )
        if let product = p["Product"] as? PFObject{
            view.ProductString = product["ProductName"] as? String ?? pagestring
            view.Product = product
            view.addProductImage()
            
        }
        
        
        
        
        
        

        
        view.backgroundColor = UIColor.white
        view.setupProductView()
        //view.backgroundColor = colors[i]
        self.addSubview(view)
        
        x = view.frame.origin.x + viewWidth + padding
        
        super.contentSize = CGSize(width:x+padding, height: super.frame.size.height)
        
    }
    
    func setupPages(){
        
        
        
        //add title card for different sections
        //        let titlecard: ProductView = ProductView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight) )
        //        titlecard.addCategorylabel(categoryName: self.producttype)
        //        self.addSubview(titlecard)
        //        x = titlecard.frame.origin.x + viewWidth + padding
        //        super.contentSize = CGSize(width:x+padding, height: super.frame.size.height)
        
        if (relations.count <= 0){
            addDefaultPage()
            
            
            
        }
        
        for item in relations{
            
            addProductPage(p: item)
            
            
            
        }
        
    }
    
    
    
    
    
}
