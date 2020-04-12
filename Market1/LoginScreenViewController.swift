//
//  LoginScreenViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 12/26/19.
//  Copyright © 2019 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class LoginScreenViewController: UIViewController {
   
    @IBOutlet weak var SigninUserField: UITextField!
    @IBOutlet weak var SigninPasswordField: UITextField!
    @IBOutlet weak var SignupUserField: UITextField!
    @IBOutlet weak var SignupPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SigninUserField.text = ""
        SigninPasswordField.text = ""
        SignupUserField.text = ""
        SignupPasswordField.text = ""

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentUser = PFUser.current()
        if currentUser != nil {
            loadHomeScreen()
        }
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
    
    
   
    @IBAction func Signin(_ sender: UIButton) {
        let sv = UIViewController.displaySpinner(onView: self.view)
                   PFUser.logInWithUsername(inBackground: SigninUserField.text!, password: SigninPasswordField.text!) { (user, error) in
                       UIViewController.removeSpinner(spinner: sv)
                       if user != nil {
                           self.loadHomeScreen()
                       }else{
                           if let descrip = error?.localizedDescription{
                               self.displayErrorMessage(message: (descrip))
                           }
                       }
                   }
    }
    

    @IBAction func Signup(_ sender: UIButton) {
        let user = PFUser()
        //create empty profile for user
        let userProfile = PFObject(className:"UserProfile")
        
        
           user.username = SignupUserField.text
           user.password = SignupPasswordField.text
           let sv = UIViewController.displaySpinner(onView: self.view)
        
           user.signUpInBackground { (success, error) in
               UIViewController.removeSpinner(spinner: sv)
               if success{
                //if user sign up is successful associate them with the profile
                user["Profile"] = userProfile
            
                user.saveInBackground()
                   self.loadHomeScreen()
               }else{
                   if let descrip = error?.localizedDescription{
                       self.displayErrorMessage(message: descrip)
                   }
               }
           }
   
    
    
    
    
    
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
