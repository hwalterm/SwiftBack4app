//
//  FilterViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 6/14/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit

protocol FilterSelectionDelegate {
    func didSelectFilters (filteritems: [String])
}


class FilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - ACTIONS
    
    
    @IBAction func DoneButton(_ sender: Any) {
        
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
