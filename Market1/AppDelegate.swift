//
//  AppDelegate.swift
//  Market1
//
//  Created by Hershel Alterman on 12/25/19.
//  Copyright © 2019 Hershel Alterman. All rights reserved.
//

import UIKit
import Parse
import Apollo

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let apollo: ApolloClient = { 
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "X-Parse-Application-Id": "bBqOyGeTfdYzn981GAwxUFYiIxWcLYwfV32bnuZH",
            "X-Parse-Client-Key": "EOkj5dmtqFe6Nr5Uxwwrr1mBNxKIZC9NkH7xJglt"
        ]
        
        let url = URL(string: "https://parseapi.back4app.com/graphql")!
        
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(
                url: url
            )
        )
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = ParseClientConfiguration {
            $0.applicationId = "bBqOyGeTfdYzn981GAwxUFYiIxWcLYwfV32bnuZH"
            $0.clientKey = "EOkj5dmtqFe6Nr5Uxwwrr1mBNxKIZC9NkH7xJglt"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        saveInstallationObject()
        return true
    }
    
    
    func saveInstallationObject(){
            if let installation = PFInstallation.current(){
                installation.saveInBackground {
                    (success: Bool, error: Error?) in
                    if (success) {
                        print("You have successfully connected your app to Back4App!")
                    } else {
                        if let myError = error{
                            print(myError.localizedDescription)
                        }else{
                            print("Uknown error")
                        }
                    }
                }
            }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

