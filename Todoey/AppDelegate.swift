//
//  AppDelegate.swift
//  Todoey
//
//  Created by Djauhery on 10/8/18.
//  Copyright © 2018 Djauhery. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
//        let data = Data()
//        data.name = "Djauhery"
//        data.age = 16
        
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(data)
//            }
//        } catch {
//            print("Error initialisation of realm ... \(error)")
//        }

        do {
            let _ = try Realm()
        } catch {
            print("Error initialisation of realm ... \(error)")
        }
        return true
    }
    
}

