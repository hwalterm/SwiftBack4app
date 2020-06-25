//
//  ProfileViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 1/2/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    
   @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var SkinTypePicker: UIPickerView!
    @IBOutlet weak var EyeColorPicker: UIPickerView!
    var currprofile: UserProfile?
    var SkinTypePickerData: [String] = [String]()
    var EyeColorPickerData: [String] = [String]()
  
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SkinTypePicker.delegate = self
        self.EyeColorPicker.delegate = self
        SkinTypePickerData = ["Dry", "Oily", "Normal", "Combination"]
        EyeColorPickerData = ["Brown", "Green", "Blue","Hazel"]
        
        UsernameLabel.text = PFUser.current()?.username

        // Do any additional setup after loading the view.
        if self.currprofile != nil {
            //let currProfile = UserProfile(user: PFUser.current()!)
            print("curr profile.skintype" + String(currprofile!.SkinType))
        
        }
        
        else{
            print("No User PRofile")
        }
    }
    

    
    
    
    func displayErrorMessage(message:String) {
        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }
    
    func loadLoginScreen(){
          let storyBoard: UIStoryboard = UIStoryboard(name: "ProfileCreation", bundle: nil)
          let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreenViewController") as! LoginScreenViewController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
      }
    
    
    
    
    
    // MARK: - Navigation
     
     func loadHomeScreen(){
         
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
         HomeViewController.modalPresentationStyle = .fullScreen
         self.present(HomeViewController, animated: true, completion: nil)
     }
    
    //MARK: Action
     

     
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
    
    
    @IBAction func HomeButtonClick(_ sender: Any) {
        loadHomeScreen()
    }
    
    
    @IBAction func SaveProf(_ sender: Any) {
        
        self.currprofile?.eyeColor = EyeColorPicker.selectedRow(inComponent: 0)
        self.currprofile?.SkinType = SkinTypePicker.selectedRow(inComponent: 0)
        currprofile?.save(navigatetohome: false)
       
        
        
        
    }
    
        
        @IBAction func logoutofApp(_ sender: UIButton) {
            let sv = UIViewController.displaySpinner(onView: self.view)
              PFUser.logOutInBackground { (error: Error?) in
                  UIViewController.removeSpinner(spinner: sv)
                  if (error == nil){
                      print("Logout successful")
                      self.loadLoginScreen()
                  }else{
                      if let descrip = error?.localizedDescription{
                          self.displayErrorMessage(message: descrip)
                      }else{
                          self.displayErrorMessage(message: "error logging out")
                      }

                  }
              }
        }
    
    //MARK: - PICKER DELEGATES
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == SkinTypePicker {
            return SkinTypePickerData.count
        }
        else if pickerView == EyeColorPicker{
            return SkinTypePickerData.count
            
        }
        else{
            return 0
        }
      }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == SkinTypePicker {
            return SkinTypePickerData[row]
        }
        else if pickerView == EyeColorPicker{
            return EyeColorPickerData[row]

        }
        else{
            return "row"
        }
    }

}
