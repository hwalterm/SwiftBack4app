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
    //var skinType: Int
    //var eyeColor:
    var profile: PFObject
   // var AcneProne: Int
    var SkinType: Int
    var eyeColor: Int
    
    
    

    init(user:PFObject) {
        
        let p = user["Profile"] as! PFObject
    
        self.profile = p
        self.SkinType = 1
        self.eyeColor = 1
    

        
       



    }
    
    
    func save() {
        profile["SkinType"] = self.SkinType
        profile["EyeColor"] = self.eyeColor
        guard let currentViewController = UIApplication.shared.keyWindow?.topMostViewController() else {
            return
        }
     
        profile.saveInBackground { (success, error) in
            
            if (success){
                let alert = UIAlertController(title: "Saved!", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                currentViewController.present(alert, animated: true)
                
                
                
            }
            else{
            if let descrip = error?.localizedDescription{
                let alert = UIAlertController(title: "Error Saving Profile", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                currentViewController.present(alert, animated: true)
                print("Error saving")
                //currentViewController.displayErrorMessage(message: descrip)
            }
        }
    }
}
        
        
 
//
//    func fetchUserData(){
//
//
//
//        profile.fetchIfNeededInBackground { (object, error) in
//            if let sk = self.profile["SkinType"] as? PFObject {
//                self.SkinType = sk["Number"] as! Int
//
//
//
//
//                } else if let errorString = error?.localizedDescription {
//                    print(errorString)
//                }
//
//        }
//
//
//
//        profile.fetchIfNeededInBackground { (object, error) in
//        if let sk = self.profile["EyeColor"] as? PFObject {
//            self.SkinType = sk["Number"] as! Int
//
//
//            } else if let errorString = error?.localizedDescription {
//                print(errorString)
//            }
//
//        }
//    }
    
 
     
    
}
