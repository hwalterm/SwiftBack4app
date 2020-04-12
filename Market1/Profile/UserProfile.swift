//
//  UserProfile.swift
//  Market1
//
//  Created by Hershel Alterman on 3/16/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class UserProfile {
    var skinType: String
    var eyeColor: String
    var profile: PFObject
    

    init(user:PFObject) {
        
        let p = user["Profile"] as! PFObject
    
        self.profile = p
        self.skinType = ""
        self.eyeColor = ""
//        p.fetchIfNeededInBackground { (object, error) in
//            if let sk = p["SkinType"] as? String {
//                self.skinType = sk
//
//            } else if let errorString = error?.localizedDescription {
//                print(errorString)
//            }
            
            
        
            
           
            print(self.skinType)
            
            
        //}

        
       



    }
}
