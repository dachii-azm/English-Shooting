//
//  AppDelegate.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/16.
//  Copyright © 2019 dachii. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let dict = ["firstLaunch": true]
        // デフォルト値登録
        // UserDefaultsを使ってフラグを保持する
        let userDefault = UserDefaults.standard
        // ※すでに値が更新されていた場合は、更新後の値のままになる
        userDefault.register(defaults: dict)
        
        // "firstLaunch"に紐づく値がtrueなら(=初回起動)、値をfalseに更新して処理を行う
        if userDefault.bool(forKey: "firstLaunch") {
            userDefault.set(false, forKey: "firstLaunch")
            print("COMPLETE FIRST CONFIGURE")
            configure()
        }
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
    }


}

//MARK Configure UserDefault Setting
extension AppDelegate {
    
    func configureMyDevice() {
        let myDevice: [String: Int] = [Device.device[0]: 1, Device.device[1]: 0, Device.device[2]:0, Device.device[3]: 0, Device.device[4]: 0]
        UserDefaults.standard.set(myDevice, forKey: UsData.myDevice)
    }
    
    func configureSettingDevice() {
        let settingDevice: [String: Int] = [Device.device[0]: 1]
        UserDefaults.standard.set(settingDevice, forKey: UsData.settingDevice)
    }
    
    func configureMyAmmo() {
        let myAmmo: [String: Int] = [Ammo.ammo[0]: 1, Ammo.ammo[1]: 0, Ammo.ammo[2]: 0, Ammo.ammo[3]: 0, Ammo.ammo[4]: 0]
        UserDefaults.standard.set(myAmmo, forKey: UsData.myAmmo)
    }
    
    func configureSettingAmmo() {
        let settingAmmo: [String: Int] = [Ammo.ammo[0]: 1]
        UserDefaults.standard.set(settingAmmo, forKey: UsData.settingAmmo)
    }
    
    func configureSettingWordList() {
        let settingWordList: [String] = WordList.WordList
        UserDefaults.standard.set(settingWordList, forKey: UsData.settingWordList)
    }
    
    func configure() {
        configureMyDevice()
        configureSettingDevice()
        configureMyAmmo()
        configureSettingAmmo()
        configureSettingWordList()
    }
}


