//
//  ProductView.swift
//  Market1
//
//  Created by Hershel Alterman on 2/28/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit

class ProductView: UIView {
    var Product: String
    
    
    
    required override init(frame: CGRect){
        Product = ""
        super.init(frame: frame)
        super.layer.cornerRadius = 8
        //var myFrame : CGRect = frame
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        Product = ""
        super.init(coder: coder)
        super.layer.cornerRadius = 8
    }
    
    func setupProductView(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 30))
        label.text = Product
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
