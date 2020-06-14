//
//  CreateProfileSensitiveViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 4/23/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse
class CreateProfileSensitiveViewController: UIViewController {
    
    var sensitiveskin: Int = 0
    var antiaging: Int = 0
    var currprofile: UserProfile = UserProfile(user: PFUser.current()!)

    @IBOutlet weak var SensitiveSkinControl: UISegmentedControl!
    
    @IBOutlet weak var AntiAgingControl: UISegmentedControl!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func SensitiveSkinControlAction(_ sender: Any) {
        sensitiveskin = SensitiveSkinControl.selectedSegmentIndex
        //Debug
        print("Sensitive Skin: " + String(sensitiveskin))
    }
    
    @IBAction func AntiAgingAction(_ sender: Any) {
        antiaging = AntiAgingControl.selectedSegmentIndex
        print("Anti Aging: " + String(antiaging))
        
    }
    
    @IBAction func CreateProfileClick(_ sender: Any) {
        
        currprofile.sensitiveSkin = self.sensitiveskin
        currprofile.antiAging = self.antiaging
        currprofile.save(navigatetohome: true)
        print("skin type: " + String(currprofile.SkinType))
    }
    
   
    // MARK: - Navigation
     
     
     /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Save data
//    func SaveProfile() {
//        let user = PFUser.current()!
//        let p = user["Profile"] as! PFObject
//
//
//    }
//
    

}
