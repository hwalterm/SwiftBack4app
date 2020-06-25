//
//  FilterViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 6/14/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit



protocol FilterSelectionDelegate {
   
    func didSelectFilters (filteritems: [String], togglestates: Dictionary<String, Bool>)
}


class FilterViewController: UIViewController {
    
    var togglestates: Dictionary<String, Bool> = [:]
    var filterDelegate: FilterSelectionDelegate!
    @IBOutlet weak var MascaraToggle: UIButton!
    @IBOutlet weak var FoundationToggle: UIButton!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(displayP3Red:1, green: (220/255), blue: (239/255), alpha: 1)
        super.viewDidLoad()
        
        MascaraToggle.isSelected = togglestates["Mascara"]!
        FoundationToggle.isSelected = togglestates["Foundation"]!
        

        // Do any additional setup after loading the view.
    }
    
    // MARK: - ACTIONS
    
    @IBAction func FoundationToggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        togglestates["Foundation"] = sender.isSelected
        
    }
    
    @IBAction func MascaraToggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        togglestates["Mascara"] = sender.isSelected
    }
    
    
    @IBAction func DoneButton(_ sender: Any) {
        
        var selectedFields: [String] = []
        
        if (MascaraToggle.isSelected){
            selectedFields.append("Mascara")
        }
        
        if (FoundationToggle.isSelected){
            selectedFields.append("Foundation")
        }
        
        if ((filterDelegate) != nil){
            filterDelegate.didSelectFilters(filteritems: selectedFields, togglestates: self.togglestates)}
        else{
            print("Error Missing Filter delegate ")
        }
        
        
    
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
