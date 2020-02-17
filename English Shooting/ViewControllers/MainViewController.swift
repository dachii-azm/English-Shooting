//
//  TableViewController.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/28.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import LTMorphingLabel

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //This array is shown to Cells
    private var userCells = getCellDatas.getUserCells()
    private var equipmentCells = getCellDatas.getEquipmentCells()
    private var shopCellsList = [ShopCells]()
    private var shopCellAppend = getCellDatas.getShopCells()
    //This array get information about shopCells
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
        addCellsAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //removeCellsAnimation()
    }
}

// MARK: - Configuration
extension MainViewController {

    //Configure UITableView
    private func configureTableView() {
        self.tableView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.bounds.width, height: self.view.bounds.height - (self.navigationController?.navigationBar.frame.size.height)!)
        tableView.delegate      =  self
        tableView.dataSource    =  self
        tableView.register(CustomCellView.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    //configure all system
    private func configure() {
        configureTableView()
    }
}

// MARK: - Animation
extension MainViewController {
   
    private func addCellsAnimation() {
        for index in 0..<self.shopCellAppend.count {
            self.shopCellsList.insert(self.shopCellAppend[index], at: index)
        }
        UIView.animate(withDuration: 1) {
            self.tableView.beginUpdates()
            var paths = [IndexPath]()
            for index in 0..<self.shopCellAppend.count {
                paths.append(IndexPath(row: index, section: 0))
            }
            self.tableView.insertRows(at: paths, with: .automatic)
            self.tableView.endUpdates()
        }
    }
    
    private func removeCellsAnimation() {
        self.shopCellsList.removeAll()
        var paths = [IndexPath]()
        for index in 0..<self.shopCellAppend.count {
            paths.append(IndexPath(row: index, section: 0))
        }
        
        UIView.animate(withDuration: 2, animations: {
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: paths, with: .automatic)
            self.tableView.endUpdates()},
                completion: { (finished: Bool) in
                    if finished == true {}
                }
        )
    }
}

//MARK otherwise
extension MainViewController {

    //use NavigationController and move to next VC
    private func moveToNextVC(VC: UIViewController) {
        navigationController?.pushViewController(VC, animated: true)
    }
}

//TableView And CellView
extension MainViewController {
    
    // Number Of Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return Main.sectionList.count
    }
    
    // Title Of Section
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return Main.sectionList[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userCells.count
        }
        else if section == 1 {
            return equipmentCells.count
        }
        else if section == 2 {
            return shopCellsList.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellView
        
        if indexPath.section == 0 {
            cell.userCells = userCells[indexPath.row]
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.deviceCells = (equipmentCells[0] as! ContextOfDevice)
            } else if indexPath.row == 1 {
                cell.ammoCells = (equipmentCells[1] as! ContextOfAmmo)
            }
        } else if indexPath.section == 2 {
            cell.shopCells = shopCellsList[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let VC: [UIViewController] = [DeviceViewController(), AmmoViewController(), SkillViewController()]
            //removeCellsAnimation(VC: VC[indexPath.row])
            self.moveToNextVC(VC: VC[indexPath.row])
        } else {}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
