//
//  ViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 12/25/19.
//  Copyright © 2019 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController  {
    //MARK: Properties
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scrollView : MainScrollView = MainScrollView(frame: CGRect(x: 60, y: 200,
                                                                       width: 300, height: 300))
        
   //     NSLayoutConstraint.activate([scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)])
        
        
        view.addSubview(scrollView)
        
             NSLayoutConstraint.activate([scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)])
        
        
        
    }
    
    
    
    // Do any additional setup after loading the view.
    
    
    
    
    
    
    func loadProfileScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ProfileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        ProfileViewController.modalPresentationStyle = .fullScreen
        let curruser = PFUser.current()!
        let p = curruser["Profile"] as! PFObject
        //let currProfile = UserProfile(curruser)
        
                p.fetchIfNeededInBackground { (object, error) in
                   if let sk = p["SkinType"] as? String {
                    
                    let currprofile = UserProfile(user: curruser)
                    currprofile.skinType = p["SkinType"] as! String
                    ProfileViewController.currprofile = currprofile
                    self.present(ProfileViewController, animated: true, completion: nil)

                    } else if let errorString = error?.localizedDescription {
                        print(errorString)
                    }

                    
                
                    

                    
            }
        //fetch profile in background and use to initialize userProfile object
        //Call present after initialized
        
        
    
    }
    
    
    func loadHomeScreen(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        HomeViewController.modalPresentationStyle = .fullScreen
        self.present(HomeViewController, animated: true, completion: nil)
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
    
    @IBAction func Profile(_ sender: Any) {
        loadProfileScreen()
    }
    
}

//MARK: Table View




