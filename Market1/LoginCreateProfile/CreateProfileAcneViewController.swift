//
//  CreateProfileAcneViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 4/19/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit

class CreateProfileAcneViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var AcnePickerData: [String] = [String]()
    var Acneselection: Int = 0
    @IBOutlet weak var AcnePicker: UIPickerView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.AcnePicker.delegate = self
        self.AcnePicker.dataSource = self
        AcnePickerData = ["No", "Yes", "Occasionally"]
       
        
        
        

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
        if pickerView == AcnePicker {
            return AcnePickerData.count
        }
    
        else{
            return 0
        }
      }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == AcnePicker {
            return AcnePickerData[row]
        }
       
        else{
            return "row"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.Acneselection = AcnePicker.selectedRow(inComponent: 0)
        
        
    }

}
