//
//  ViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 12/25/19.
//  Copyright © 2019 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
   
    
    
    func loadProfileScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(viewController, animated: true, completion: nil)
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
    
    //MARK: Actions
    
    @IBAction func ProfileButton(_ sender: UIButton) {
        self.loadProfileScreen()
    }
    

}

