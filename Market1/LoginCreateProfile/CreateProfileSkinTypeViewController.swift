//
//  CreateProfileViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 4/18/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit

class CreateProfileSkinTypeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var skinTypePicker: UIPickerView!
    var SkinTypePickerData: [String] = [String]()
    var skintypeselection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skinTypePicker.delegate = self
        self.skinTypePicker.dataSource = self
        SkinTypePickerData = ["Dry", "Oily", "Normal", "Combination"]
       
        
        //self.view.backgroundColor = UIColor(displayP3Red:1, green: 0, blue: 0.15, alpha: 0.3)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: - PICKER DELEGATES
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == skinTypePicker {
            return SkinTypePickerData.count
        }
    
        else{
            return 0
        }
      }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == skinTypePicker {
            return SkinTypePickerData[row]
        }
       
        else{
            return "row"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.skintypeselection = skinTypePicker.selectedRow(inComponent: 0)
        
        
    }

}
