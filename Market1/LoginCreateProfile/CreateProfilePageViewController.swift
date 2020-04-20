//
//  CreateProfilePageViewController.swift
//  Market1
//
//  Created by Hershel Alterman on 4/19/20.
//  Copyright © 2020 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse

class CreateProfilePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
   
    

   lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "CreateProfileSkinTypeViewController"),
                self.newVc(viewController: "CreateProfileAcneViewController")]
    }()

    var pageControl = UIPageControl()
    let user = PFUser.current()!
    var currentprofile = UserProfile(user: PFUser.current()!)
    
    






    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self

        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
            
            
            configurePageControl()
        }

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

    

    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "ProfileCreation", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    
    //MARK: Datasource Functions
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
           guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
               return nil
           }
           
           let previousIndex = viewControllerIndex - 1
           
           // User is on the first view controller and swiped left to loop to
           // the last view controller.
           guard previousIndex >= 0 else {
               return orderedViewControllers.last
               // Uncommment the line below, remove the line above if you don't want the page control to loop.
               // return nil
           }
           
           guard orderedViewControllers.count > previousIndex else {
               return nil
           }
           
           return orderedViewControllers[previousIndex]
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
               return nil
           }
           
           let nextIndex = viewControllerIndex + 1
           let orderedViewControllersCount = orderedViewControllers.count
           
           // User is on the last view controller and swiped right to loop to
           // the first view controller.
           guard orderedViewControllersCount != nextIndex else {
               return orderedViewControllers.first
               // Uncommment the line below, remove the line above if you don't want the page control to loop.
               // return nil
           }
           
           guard orderedViewControllersCount > nextIndex else {
               return nil
           }
           
           return orderedViewControllers[nextIndex]
       }
    
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
}
