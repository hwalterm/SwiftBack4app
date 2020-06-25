//
//  ProductView.swift
//  Market1
//
//  Created by Hershel Alterman on 2/28/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse


class ProductView: UIView {
    var ProductString: String
    var imageview: UIImageView?
    var imageFile: PFFileObject?
    var Product: PFObject?
    
    
    required override init(frame: CGRect){
        ProductString = "No Products Founds"
        super.init(frame: frame)
        super.layer.cornerRadius = 8
        //var myFrame : CGRect = frame
    
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        ProductString = "No Products Found"
        super.init(coder: coder)
        super.layer.cornerRadius = 8
      
    }
    
    func setupProductView(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 30))
        label.text = ProductString
        label.textAlignment = .center
        
        self.addSubview(label)
        
       
        
    }
    
    func addCategorylabel(categoryName: String){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
        label.font = UIFont(name: "Chalkduster", size: 34)
        label.text = categoryName
        label.textAlignment = .center
        self.backgroundColor = .systemTeal
        
        self.addSubview(label)
        
    }
    
    func addProductImage(){
        
        if let userImageFile = Product!["image"] as? PFFileObject{
            userImageFile.getDataInBackground { (imageData: Data?, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let imageData = imageData {
                    let productImage = UIImage(data:imageData)
                    self.imageview = UIImageView(image: productImage)
                    
                    self.addSubview(self.imageview!)
                    self.imageview!.frame = CGRect(x: self.frame.midX + 30 - (self.frame.width / 2), y: self.frame.midY + 30 - (self.frame.height / 2), width: self.frame.width - 60, height: self.frame.height - 60)
                    
                
                }
            }
        }
    }
    
//    init(frame: CGRect , product: String){
//    
//        
//        Product = product
//        super.init(frame: frame)
//        //var myFrame : CGRect = frame
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 30))
//        label.text = "Product"
//        label.textAlignment = .center
//        
//        self.addSubview(label)
//        
//    }
    
   
    
    
}
