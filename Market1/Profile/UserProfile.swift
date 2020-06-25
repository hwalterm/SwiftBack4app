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
    var acneProne: Int
    var sensitiveSkin: Int
    var antiAging: Int
    var foundationCoverage: Float
    var concealerCoverage: Float
    var concealerFormulation: Int
    var PriceMax: Int
    var PriceMin: Int
    var MakeupFrequency: Int
    
    
    
    

    init(user:PFObject) {
        
        let p = user["Profile"] as! PFObject
    
        self.profile = p
        self.SkinType = 0
        self.eyeColor = 0
        self.acneProne = 0
        self.sensitiveSkin = 0
        self.antiAging = 0
        self.foundationCoverage = 0
        self.concealerCoverage = 0
        self.concealerFormulation = 0
        self.PriceMax = 10000
        self.PriceMin = 0
        self.MakeupFrequency = 0
        
    

        
       



    }
    
    
    func save(navigatetohome:Bool?) {
        profile["SkinType"] = self.SkinType
        profile["EyeColor"] = self.eyeColor
        profile["AntiAging"] = self.antiAging
        profile["AcneProne"] = self.acneProne
        profile["SensitiveSkin"] = self.sensitiveSkin
        


        
        guard let currentViewController = UIApplication.shared.keyWindow?.topMostViewController() else {
            return
        }
        let sv = UIViewController.displaySpinner(onView: currentViewController.view)
     
        profile.saveInBackground { (success, error) in
            UIViewController.removeSpinner(spinner: sv)
            
            if (success){
                
                if (navigatetohome ?? false){
                    
                    PFCloud.callFunction(inBackground: "UpdateUserProducts", withParameters: ["UserProfile": self.profile.objectId]) {
                        (response, error) in
                   
                 
                    }
                    self.loadHomeScreen()
                }
                else{
                    let alert = UIAlertController(title: "Saved!", message: "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    currentViewController.present(alert, animated: true)
                }
                
                
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
    
 
     func loadHomeScreen(){
        guard let currentViewController = UIApplication.shared.keyWindow?.topMostViewController() else {
            return
        }
         
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
         HomeViewController.modalPresentationStyle = .fullScreen
         currentViewController.present(HomeViewController, animated: true, completion: nil)
     }
    
}
