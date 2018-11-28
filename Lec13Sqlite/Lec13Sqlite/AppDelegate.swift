//
//  AppDelegate.swift
//  Lec13Sqlite
//
//  Created by hackeru on 28/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CoreData
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let createTableString = """
                        CREATE TABLE characters(id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                firstName TEXT NOT NULL,
                                                lastName TEXT NOT NULL,
                                                serialNumber INTEGER
                                               )
                      """
    
    let dropTableString = "DROP TABLE characters"
    
    //prepared Statment: ? are placeholders (we bind data to ?)
    let insertString = """
                            INSERT INTO characters(firstName, lastName, serialNumber)
                            VALUES(?, ?, ?)
                       """
    
    let selectString = "SELECT * FROM characters;"
    //use prepared stement
    func selectCharacter(){
        var stmt:OpaquePointer? = nil
        if sqlite3_prepare_v2(db, selectString, -1, &stmt, nil) == SQLITE_OK{
            //use the stmt
            while sqlite3_step(stmt) == SQLITE_ROW{
                //0 based
                let id = sqlite3_column_int(stmt, 0) //Int32
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let last = String(cString: sqlite3_column_text(stmt, 2))
                let serial = sqlite3_column_int(stmt, 3)
                
                print(id, name, last, serial)
            }
        }else{
            print("Could not prepare")
        }
        
    }
    
    func insert(){
        var preparedStatement:OpaquePointer? = nil
        //convert the insertString to a prepared statement
        
        if sqlite3_prepare_v2(db, insertString,-1, &preparedStatement, nil) == SQLITE_OK{
            let serialNumber: Int32 = 1
            let firstName: NSString = "Ned"
            let lastName: NSString = "Stark"
            
            //bind the ?
            sqlite3_bind_int(preparedStatement, 3, serialNumber)
            sqlite3_bind_text(preparedStatement,1, firstName.utf8String, -1, nil)
            sqlite3_bind_text(preparedStatement,2, lastName.utf8String, -1, nil)
            
            //use the statement
            if sqlite3_step(preparedStatement) == SQLITE_DONE{
               print("Inserted")
            }else{
                print("Can't insert")
            }
        }else{
            print("Can't prepare statememnt")
        }
        sqlite3_finalize(preparedStatement)
    }
    
    var db = openDatabase()
    
    func createTable(){
        if  sqlite3_exec(db, createTableString, nil, nil, nil) != SQLITE_OK {
            print("Cant Create Table")
            let errMessage = sqlite3_errmsg(db)
            let errString = String(cString: errMessage!)
            print(errString)
        }else{
            print("Table Created")
        }
    }
    
    func dropTable(){
        if  sqlite3_exec(db, dropTableString, nil, nil, nil) != SQLITE_OK {
            print("Cant Drop Table")
            let errMessage = sqlite3_errmsg(db)
            let errString = String(cString: errMessage!)
            print(errString)
        }else{
            print("Table Dropped")
        }
    }
    
    
    static func openDatabase()->OpaquePointer?{
        //new file->app dirs
        let fm = FileManager.default
        let documents = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dbPath = documents.absoluteString + "mydb"
        fm.createFile(atPath: dbPath, contents: Data(), attributes: nil)
        
        var db:OpaquePointer? = nil
        
        if(sqlite3_open(dbPath, &db) == SQLITE_OK){
            print("DB is open")
            return db
        }else{
            fatalError("Can't open data base, did you create the file?")
        }
    }
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        selectCharacter()
       // createTable()
        // Override point for customization after application launch.
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Lec13Sqlite")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

