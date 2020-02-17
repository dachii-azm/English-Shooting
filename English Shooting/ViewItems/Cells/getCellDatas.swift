//
//  CellDatas.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/01.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit


class getCellDatas {
    
    static func getUserCells() -> [UserCells] {
        let userCells = Main.user
        return userCells
    }
    
    static func getShopCells() -> [ShopCells] {
        let shopCells = Main.shop
        return shopCells
    }
    
    static func getEquipmentCells() -> [Any] {
        let equipmentCells: [Any] = [loadSettingDevice(), loadSettingAmmo()]
        return equipmentCells
    }
    
    static func getChooseGameLevelCells() -> [ChooseGameLevelCells] {
        let chooseGameLevelCells = Game.GameLevel
        return chooseGameLevelCells
    }
    
    static func getDeviceCells() -> [ContextOfDevice] {
        let deviceCells = [
                Device.fountainPen[loadMyDevice()[0]],
                Device.pencil[loadMyDevice()[1]],
                Device.paintBrush[loadMyDevice()[2]],
                Device.creyon[loadMyDevice()[3]],
                Device.marker[loadMyDevice()[4]],
            ]
        return deviceCells
    }
    
    static func getAmmoCells() -> [ContextOfAmmo] {
        let ammoCells = [
            Ammo.comma[loadMyAmmo()[0]],
            Ammo.alphabet[loadMyAmmo()[1]],
            Ammo.paint[loadMyAmmo()[2]],
            Ammo.laser[loadMyAmmo()[3]],
            Ammo.missile[loadMyAmmo()[4]]
        ]
        return ammoCells
    }
}

extension getCellDatas {
    
   static func loadMyDevice() -> [Int] {
        let myDevice = UserDefaults.standard.dictionary(forKey: UsData.myDevice)
        let myDeviceValues: [Int] = Array(myDevice!.values) as! [Int]
        
        return myDeviceValues
    }
    
    static func loadMyAmmo() -> [Int] {
        let myAmmo = UserDefaults.standard.dictionary(forKey: UsData.myAmmo)
        let myAmmoValues: [Int] = Array((myAmmo?.values)!) as! [Int]
        
        return myAmmoValues
    }
    
    //Decide Device and DeviceLevel and Push them
    static func loadSettingDevice() -> ContextOfDevice {
        if (UserDefaults.standard.dictionary(forKey: UsData.settingDevice) != nil) {
          var settingDevice = UserDefaults.standard.dictionary(forKey: UsData.settingDevice)
            print(settingDevice as Any)
          let settingDeviceValue: [Int] = Array(settingDevice!.values) as! [Int]
          let settingDeviceKey: [String] = Array(settingDevice!.keys)
          let deviceNumber = Device.device.firstIndex(of: settingDeviceKey[0])
          let devices: [ContextOfDevice] = Device.deviceList[deviceNumber!]
          let device: ContextOfDevice = devices[settingDeviceValue[0] - 1]
        
          return device
        } else {
            var settingDevice: Dictionary = ["fountain pen": 1]
            print(settingDevice)
            let settingDeviceValue: [Int] = Array(settingDevice.values)
            let settingDeviceKey: [String] = Array(settingDevice.keys)
            let deviceNumber = Device.device.firstIndex(of: settingDeviceKey[0])
            let devices: [ContextOfDevice] = Device.deviceList[deviceNumber!]
            let device: ContextOfDevice = devices[settingDeviceValue[0] - 1]
            
            return device
        }
        
    }
    
    //Decide Ammo and Ammolevel and push them
    static func loadSettingAmmo() -> ContextOfAmmo {
        if (UserDefaults.standard.dictionary(forKey: UsData.settingAmmo) != nil) {
            let settingAmmo = UserDefaults.standard.dictionary(forKey: UsData.settingAmmo)
            let settingAmmoValue: [Int] = Array(settingAmmo!.values) as! [Int]
            let settingAmmoKey: [String] = Array(settingAmmo!.keys)
            let ammoNumber = Ammo.ammo.firstIndex(of: settingAmmoKey[0])
            let ammos: [ContextOfAmmo] = Ammo.ammoList[ammoNumber!]
            let ammo: ContextOfAmmo = ammos[settingAmmoValue[0] - 1]
        
            return ammo
        } else {
            let settingAmmo: Dictionary = ["comma": 1]
            let settingAmmoValue: [Int] = Array(settingAmmo.values)
            let settingAmmoKey: [String] = Array(settingAmmo.keys)
            let ammoNumber = Ammo.ammo.firstIndex(of: settingAmmoKey[0])
            let ammos: [ContextOfAmmo] = Ammo.ammoList[ammoNumber!]
            let ammo: ContextOfAmmo = ammos[settingAmmoValue[0] - 1]
            
            return ammo
        }
        
    }
    
    
    
}
