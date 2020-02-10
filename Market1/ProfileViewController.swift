//
//  ProfileViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 1/2/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    @IBOutlet weak var UsernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UsernameLabel.text = NSFullUserName()

        // Do any additional setup after loading the view.
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
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreenViewController") as! LoginScreenViewController
          self.present(viewController, animated: true, completion: nil)
      }
    
    
    /*
    // MARK: - Navigation
     
   
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
        
        @IBAction func logoutofApp(_ sender: UIButton) {
            let sv = UIViewController.displaySpinner(onView: self.view)
              PFUser.logOutInBackground { (error: Error?) in
                  UIViewController.removeSpinner(spinner: sv)
                  if (error == nil){
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

}
