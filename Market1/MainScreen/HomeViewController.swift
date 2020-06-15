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
    
    @IBOutlet weak var FilterViewButton: UIButton!
    var Categories = ["Foundation", "Masacara"]
    
    
    
    var titleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIStackView inside UIScrollView."
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }
    lazy var VerticalscrollView: UIScrollView = {
        let VerticalscrollView = UIScrollView()
        VerticalscrollView.translatesAutoresizingMaskIntoConstraints = false
        return VerticalscrollView
    }()

    lazy var VerticalstackView: UIStackView = {
        let VerticalstackView = UIStackView()
        VerticalstackView.axis = .vertical
        VerticalstackView.distribution = UIStackView.Distribution.equalSpacing
        VerticalstackView.spacing = 30
        VerticalstackView.translatesAutoresizingMaskIntoConstraints = false
        return VerticalstackView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        setupViews()
        setupLayout()
        
        
        
    
        
        
       

        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        


           //     NSLayoutConstraint.activate([scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)])
                
                
                
                
        //             NSLayoutConstraint.activate([scrollView.centerXAnchor.constraint(equalTo: outerScrollView.centerXAnchor)])
    }
    
    
    
    // Do any additional setup after loading the view.
    
    
    
    
    
    
    func loadProfileScreen(){
        print("opening profile")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ProfileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        ProfileViewController.modalPresentationStyle = .fullScreen
        let curruser = PFUser.current()!
        let p = curruser["Profile"] as! PFObject
        let currProfile = UserProfile(user: curruser)
        
        p.fetchIfNeededInBackground { (object, error) in
            if (p["EyeColor"] as? Int) != nil {
                currProfile.SkinType = p["SkinType"] as! Int
                
                ProfileViewController.currprofile = currProfile
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
    
    
    
    @IBAction func FilterButtonClick(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let FilterVC = storyBoard.instantiateViewController(withIdentifier: "FilterView")
        FilterVC.modalPresentationStyle = .popover
    
        
        self.present(FilterVC,animated:true, completion: nil)
    

    }
    


//MARK: Setup views
    
    
    private func setupViews() {
        print("setting up view")
        VerticalscrollView.backgroundColor = UIColor(displayP3Red:1, green: (220/255), blue: (239/255), alpha: 1)
        VerticalscrollView.addSubview(contentView)
        contentView.addSubview(VerticalstackView)
        VerticalstackView.alignment = .center
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        let minimumdim = min(screenWidth, screenHeight) - 10
        let Categories = self.Categories
        
         for i in Categories {
            let ProductscrollView : MainScrollView = MainScrollView(frame: CGRect(x: 0, y: 0,width: minimumdim, height: minimumdim * 0.75))
             ProductscrollView.translatesAutoresizingMaskIntoConstraints = false
             ProductscrollView.backgroundColor = .darkGray
             VerticalstackView.addArrangedSubview(ProductscrollView)
             

         let widthConstraint = NSLayoutConstraint(item: ProductscrollView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: minimumdim)
         let heightConstraint = NSLayoutConstraint(item: ProductscrollView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: minimumdim * 0.75 )

             VerticalstackView.addConstraints([heightConstraint,widthConstraint])

        }
        
        
        
        view.addSubview(VerticalscrollView)
        
        
        
        
    
        

        

        
        
    }
    
    private func setupLayout() {
        VerticalscrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        VerticalscrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        VerticalscrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        VerticalscrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        
        
        
        
        contentView.topAnchor.constraint(equalTo: VerticalscrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: VerticalscrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: VerticalscrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: VerticalscrollView.bottomAnchor).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: VerticalscrollView.widthAnchor).isActive = true
        
        
        VerticalstackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        VerticalstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        VerticalstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        VerticalstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }


}

extension HomeViewController: FilterSelectionDelegate{
    func didSelectFilters (filteritems: [String]){
        
        self.Categories = filteritems
        setupViews()
        
    }
    
}




 





