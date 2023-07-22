//
//  appDelegate.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Foundation
import RealmSwift
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate    {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            let realm = try Realm()
            // Add any additional configuration here if needed
            let realmConfig = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            Realm.Configuration.defaultConfiguration = realmConfig
        } catch {
            print("Error initializing Realm: \(error)")
        }
        return true
    }
 }
