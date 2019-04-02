//
//  AppDelegate.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/22/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import EstimoteProximitySDK


@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var proximityObesrver: ProximityObserver!
    
    var ClosestExhibitVC: ClosestExhibitViewController?
    
    
    var tag: String!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        
        //connect to app
        let cloudCredentials = CloudCredentials(appID: "msu-museum-app-ffw",
                                                appToken: "1c9a14dc1e1ae1b08381ca09279d4e48")
        
        
        // set up proximity observer
        self.proximityObesrver = ProximityObserver(
            credentials: cloudCredentials,
            onError: { error in
                print("proximity observer error: \(error)")
            }
        )

        //set up first floor maajor
        let firstFloor = ProximityZone(tag: "firstFloor", range: .near)
        firstFloor.onContextChange = { contexts in
            let floor: [String] = contexts.map { context in
                print(context)
                
                //self.tag = context.attachments["test"]
                
                
                print(context.attachments)
                
                self.tag = context.attachments["rooms"]
                
                return context.attachments["rooms"]!
                
                
            }

            
            print("first floor active: \(floor)")
        }
        firstFloor.onExit = { _ in
            print("Bye bye, First floor!")
        }
        
        let secondFloor = ProximityZone(tag: "secondFloor", range: .near)
        secondFloor.onContextChange = { contexts in
            let floor: [String] = contexts.map { context in
                print(context)
                
                //self.tag = context.attachments["test"]
                self.tag = context.attachments["rooms"]
                
                return context.attachments["rooms"]!
                
                
            }
            
            
            print("second floor active: \(floor)")
        }
        secondFloor.onExit = { _ in
            print("Bye bye, Second floor!")
        }
        
        
        

        self.proximityObesrver.startObserving([firstFloor, secondFloor])
        
        return true
        }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: ObserverDelegate {
    func updateRoomBasedOnTag(tag: String) {
            print(tag)
            return
        }
}



//protocol ObserverDelegate {
//    func updateRoomBasedOnTag(tag:String)
//
//
//}





